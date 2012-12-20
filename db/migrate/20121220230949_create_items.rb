class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :target_area_id
      t.string :gender
      t.float :value
      t.string :image_url
      t.string :minecraft_image_url
      t.text :description

      t.timestamps
    end
  end
end
