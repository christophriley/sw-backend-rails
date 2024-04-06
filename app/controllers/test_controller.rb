class TestController < ApplicationController
    skip_before_action :verify_authenticity_token
    def reset
        Wallet.delete_all
        Transaction.delete_all

        startingWallets = [
            {walletIdentifier: "8c18b5bf-0171-4918-a611-bde754382f7a", balance: 2500},
            {walletIdentifier: "21f51c05-e556-41f1-9cc9-0a314bb2ebcc", balance: 200},
            {walletIdentifier: "d5af01f0-515a-4834-ab4e-a2f54aeaedbf", balance: 15300},
            {walletIdentifier: "363a3f19-7fa9-4e34-851d-6e42ef92a285", balance: 0},
        ]

        startingWallets.each do |startingWallet|
            newWallet = Wallet.create(walletIdentifier: startingWallet[:walletIdentifier], balance: startingWallet[:balance])
            newTransaction = Transaction.create(
                points: startingWallet[:balance],
                spentPoints: 0,
                timestamp: DateTime.parse("2021-10-01T11:00:00Z"),
                debitWallet: newWallet
            )
            newWallet.save()
            newTransaction.save()
        end
    end
  end
  