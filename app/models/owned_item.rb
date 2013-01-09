class OwnedItem < ActiveRecord::Base
  attr_accessible :individual_id, :item_id, :stats, :wearing, :color
  belongs_to :individual
  belongs_to :item
end
