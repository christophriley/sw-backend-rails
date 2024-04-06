class WalletsController < ApplicationController
  def index
    wallets = Wallet.all
    render json: wallets
  end
end
