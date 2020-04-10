class LoginController < ApplicationController
  get '/login' do 
    erb :'users/login'
  end

  post '/login' do
    @user = LandlordUser.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :'users/login'
    end
  end
end