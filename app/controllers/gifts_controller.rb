class GiftsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def add
      targetWalletId = params[:targetWalletId]
      targetWallet = Wallet.find_or_create_by(walletIdentifier: targetWalletId)
      puts params[:points]
      targetWallet.balance += params[:points]
      targetWallet.save
    end
  end
  