class Item < ActiveRecord::Base
  attr_accessible :description, :gender, :image_url, :minecraft_image_url, :name, :target_area_id, :value
  belongs_to :target_area
  has_many :owned_items
end
