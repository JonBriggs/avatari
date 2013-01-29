class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :add_funds, :notes, :remove_funds, :stats
  belongs_to :account
end
