class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.string :transaction_type
      t.float :amount
      t.text :description
      t.timestamps
    end
  end
end
