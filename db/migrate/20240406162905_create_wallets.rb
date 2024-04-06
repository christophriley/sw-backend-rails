class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.string :walletIdentifier, null: false
      t.integer :balance, null: false, default: 0

      t.timestamps

      t.index :walletIdentifier, unique: true
    end
  end
end
