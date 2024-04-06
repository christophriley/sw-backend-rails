class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.datetime :timestamp, null: false
      t.integer :points, null: false, default: 0
      t.integer :spentPoints, null: false, default: 0
      t.references :creditWallet, null: true, foreign_key: { to_table: :wallets}
      t.references :debitWallet, null: true, foreign_key: { to_table: :wallets}

      t.timestamps
    end
  end
end
