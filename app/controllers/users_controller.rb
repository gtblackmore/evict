class UsersController < ApplicationController

  get '/register' do
    
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect to "/users/home"
    else
      erb :'users/new'
    end
  end

  get '/users/home' do
    @user = User.find(current_user.id)
    if logged_in? && current_user = @user.id
      erb :'users/show'
    else
      redirect to "/"
    end
  end
end