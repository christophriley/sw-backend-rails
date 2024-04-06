class Wallet < ApplicationRecord
    has_many :debitTransactions
    has_many :creditTransactions
end
