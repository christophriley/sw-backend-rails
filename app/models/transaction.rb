class Transaction < ApplicationRecord
  belongs_to :creditWallet, optional: true, class_name: 'Wallet', foreign_key: 'creditWallet_id'
  belongs_to :debitWallet, optional: true, class_name: 'Wallet', foreign_key: 'debitWallet_id'
end
