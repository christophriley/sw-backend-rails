class GiftsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def add
        targetWalletId = params[:targetWalletId]
        targetWallet = Wallet.find_or_create_by(walletIdentifier: targetWalletId)
        puts params[:points]
        targetWallet.balance += params[:points]

        newTransaction = Transaction.create(
            points: params[:points],
            spentPoints: 0,
            timestamp: DateTime.now,
            debitWallet: targetWallet,
        )

        ActiveRecord::Base.transaction do
            targetWallet.save()
            newTransaction.save()
        end
    end
  end
  