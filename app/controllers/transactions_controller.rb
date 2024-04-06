class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def list
        transactions = Transaction.all
        render json: transactions
    end
end