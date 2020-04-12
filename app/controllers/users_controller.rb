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
      redirect to "/"
    else
      erb :'users/new'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end
end