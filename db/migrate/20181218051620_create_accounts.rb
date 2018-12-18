class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :account_number, :limit => 5
      t.string :account_type
      t.float :amount
      t.timestamps
    end
  end
end
