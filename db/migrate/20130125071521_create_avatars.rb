class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :gender
      t.float :value
      t.text :svg

      t.timestamps
    end
  end
end
