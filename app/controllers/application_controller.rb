require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  delete '/logout' do 
    session.clear
    redirect "/"
  end

  error ActiveRecord::RecordNotFound do
    flash[:error] = "Couldn't find that record."
    redirect "/artitems"
  end

  private 

  def current_user 
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view that page"
      redirect request.referrer || "/users/login"
    end
  end



end