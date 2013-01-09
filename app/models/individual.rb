class Individual < ActiveRecord::Base
  attr_accessible :canvas_id, :email, :firstname, :gradyear, :lastname, :sisid, :type
  has_many :owned_items
  has_many :items, :through => :owned_items
  has_many :worn_items, :class_name => OwnedItem, :conditions => 'owned_items.wearing = 1'
end
