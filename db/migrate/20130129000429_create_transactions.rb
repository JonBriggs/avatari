class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.float :add_funds
      t.float :remove_funds
      t.text :notes
      t.text :stats

      t.timestamps
    end
  end
end
