class TargetArea < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :items
end
