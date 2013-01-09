class AddWearingAndColorToOwnedItem < ActiveRecord::Migration
  def change
    add_column :owned_items, :wearing, :boolean
    add_column :owned_items, :color, :string
  end
end
