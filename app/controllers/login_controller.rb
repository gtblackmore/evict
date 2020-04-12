class LoginController < ApplicationController
  get '/login' do 
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      redirect '/users/home'
    else
      erb :'users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end