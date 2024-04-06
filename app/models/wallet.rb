class Wallet < ApplicationRecord
    has_many :debitTransactions, class_name: 'Transaction', foreign_key: 'debitWallet_id'
    has_many :creditTransactions, class_name: 'Transaction', foreign_key: 'creditWallet_id'
end
