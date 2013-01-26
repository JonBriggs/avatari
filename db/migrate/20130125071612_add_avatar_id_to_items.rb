class AddAvatarIdToItems < ActiveRecord::Migration
  def change
    add_column(:items,:avatar_id,:integer)
    remove_column(:items,:gender)
  end
end
