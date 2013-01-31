class DashboardController < ApplicationController
  def index
    @individual = current_user
    unless @individual.avatar
      redirect_to :action => "initialize_avatar"
    end
  end
  
  def initialize_avatar
    @individual = current_user
    if @individual.avatar
      redirect_to :action => "index"
    else
      @avatars = Avatar.all
    end
  end
end
