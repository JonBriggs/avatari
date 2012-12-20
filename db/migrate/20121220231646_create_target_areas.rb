class CreateTargetAreas < ActiveRecord::Migration
  def change
    create_table :target_areas do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
