class Log < ActiveRecord::Base
  attr_accessible :action, :controller, :individual_id, :stats
end
