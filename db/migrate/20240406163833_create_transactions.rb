class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :balance
      t.datetime :timestamp
      t.integer :points
      t.string :spentPoints
      t.string :integer
      t.references :creditWallet, null: true, foreign_key: true
      t.references :debitWallet, null: true, foreign_key: true

      t.timestamps
    end
  end
end
