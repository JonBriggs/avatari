class TargetArea < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :items
  
  def random_item(amount_wagered)
    #items have value which is inversely proportional to frequency of getting that item
    #wagering more increases your odds of getting better items
    #amount wagered / 2 = minimum value of item in bin amount wagered * 2 = max value in bin
    items.where("value >= ?",amount_wagered/2).where("value <= ?",amount_wagered*2).all
	
  end
end
