class Transaction < ApplicationRecord
  belongs_to :creditWallet, optional: true
  belongs_to :debitWallet, optional: true
end
