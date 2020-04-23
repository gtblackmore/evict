class UsersController < ApplicationController

  get '/register' do
    
    erb :'users/new'
  end

  post '/users' do
    
    @user = User.new(params)

    if valid_params? && @user.save
      flash[:notice] = "Please log in to continue."
      redirect to "/"
    else
      flash[:notice] = "Please complete all fields."
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