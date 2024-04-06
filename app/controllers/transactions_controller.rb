class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def list
        transactions = Transaction.all
        render json: transactions
    end

    def add
        fromWalletId = params[:creditWalletId]
        toWalletId = params[:debitWalletId]
        pointsToConsume = params[:points]
        timestamp = DateTime.parse(params[:timestamp])

        fromWallet = Wallet.find_by(walletIdentifier: fromWalletId)
        toWallet = Wallet.find_by(walletIdentifier: toWalletId)

        if fromWallet == nil
            render json: {error: "Credit wallet #{:creditWalletId} not found"}, status: 404
            return
        end

        if toWallet == nil
            render json: {error: "Debit wallet #{:debitWalletId} not found"}, status: 404
            return
        end

        if fromWallet.balance < pointsToConsume
            render json: {error: "Insufficient funds in credit wallet"}, status: 400
            return
        end

        consumedDebitTransactions = []
        consumedPoints = 0

        allDebitTransactions = Transaction
            .where(debitWallet: fromWallet)
            .where("points - spentPoints > 0")
            .order(:timestamp)
            
        allDebitTransactions.each do |thisTransaction|
            availablePoints = thisTransaction.points - thisTransaction.spentPoints
            consumedPoints = [availablePoints, pointsToConsume - consumedPoints].min
            thisTransaction.spentPoints += consumedPoints
            consumedDebitTransactions.push(thisTransaction)

            if consumedPoints >= pointsToConsume
                break
            end
        end

        newTransaction = Transaction.create(
            points: pointsToConsume,
            spentPoints: 0,
            timestamp: timestamp,
            creditWallet: fromWallet,
            debitWallet: toWallet
        )

        ActiveRecord::Base.transaction do
            fromWallet.save()
            toWallet.save()
            consumedDebitTransactions.each do |thisTransaction|
                thisTransaction.save()
            end
            newTransaction.save()
        end

        render json: consumedDebitTransactions
    end
end