class Individual < ActiveRecord::Base
  attr_accessible :canvas_id, :email, :firstname, :gradyear, :lastname, :sisid, :type, :avatar_id
  belongs_to :avatar
  has_one :account
  has_many :owned_items
  has_many :items, :through => :owned_items
  has_many :worn_items, :class_name => OwnedItem, :conditions => 'owned_items.wearing = 1'
  
  def fullname
    self.firstname + " " + self.lastname
  end
end
