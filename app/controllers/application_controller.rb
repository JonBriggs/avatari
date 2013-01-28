class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= Individual.find(session[:individual_id])
  end
end
