class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :minecraft_image_url, :name, :target_area_id, :value, :svg, :avatar_id
  belongs_to :avatar
  belongs_to :target_area
  has_many :owned_items
end
