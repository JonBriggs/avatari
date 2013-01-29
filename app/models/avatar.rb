class Avatar < ActiveRecord::Base
  attr_accessible :gender, :name, :svg, :value
  has_many :items
  has_many :individuals
end
