class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  private
  def current_user
    if session[:current_user_id]
      @current_user ||= Individual.find(session[:current_user_id])
    else
      @current_user = nil
    end

  end
end
