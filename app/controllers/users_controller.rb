class UsersController < ApplicationController

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect "/users/show"
    else
      erb :'users/new'
    end

  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by_email(params[:email])
  

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/show"
    else
      erb :'users/login'
    end

  end

  get '/users/show' do
    @user = User.find(session[:user_id])
    erb :'users/show'
  end



  # get '/users/:id/edit' do
  #   @user = User.find_by(id: params[:id])

  #   # binding.pry
  #   erb :'users/edit'

  # end




end
