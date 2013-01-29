class AddAvatarIdToIndividuals < ActiveRecord::Migration
  def change
    add_column(:individuals,:avatar_id,:integer)
  end
end
