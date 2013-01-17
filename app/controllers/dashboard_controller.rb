class DashboardController < ApplicationController
  def index
    @individual = current_user
  end
end
