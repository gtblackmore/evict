class LandlordUsersController < ApplicationController

  get '/register' do
    
    erb :'users/landlords/new'
  end

  post '/landlords' do
    @landlord_user = LandlordUser.new
    @landlord_user.first_name = params[:first_name]
    @landlord_user.last_name = params[:last_name]
    @landlord_user.email = params[:email]
    @landlord_user.password = params[:password]

    if @landlord_user.save
      redirect to "/"
    else
      erb :'users/landlords/new'
    end
  end
end