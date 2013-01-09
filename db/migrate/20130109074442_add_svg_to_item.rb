class AddSvgToItem < ActiveRecord::Migration
  def change
    add_column :items, :svg, :text
  end
end
