class CreateOwnedItems < ActiveRecord::Migration
  def change
    create_table :owned_items do |t|
      t.integer :individual_id
      t.integer :item_id
      t.string :stats

      t.timestamps
    end
  end
end
