class SessionController < ApplicationController
  def login
    if params[:username] && params[:password] == 'pwd'
      session[:username] = params[:username]
      session[:current_user_id] = Individual.find_by_email params[:username]
      render :text => 'logged in as ' + Individual.find_by_email(params[:username]).firstname
    else
      session.destroy
    end
  end
  
  def auth
    if params[:username] && params[:password] == 'pwd'
      session[:username] = params[:username]
      session[:current_user_id] = Individual.find_by_email params[:username]
      #render :text => 'logged in as ' + Individual.find_by_email(params[:username]).firstname
    else
      session.destroy
    end
    redirect_to current_user
  end

end
