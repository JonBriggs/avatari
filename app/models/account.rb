class Account < ActiveRecord::Base
  attr_accessible :canvas_course_id, :individual_id, :lms_instance
  belongs_to :individual
  has_many :transactions
  
  def balance
    amount = 0.0
    self.transactions.each do |trans|
      amount += trans.add_funds.to_f
      amount -= trans.remove_funds.to_f
    end
    amount
  end
end
