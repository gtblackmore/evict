class EntityController < ApplicationController
  before '/entities/*' do
    authentication_required
  end

  get '/entities/new' do #loads new form
    @user = @current_user
    erb :'entities/new'
  end

  #get '/entities' do #loads index page
  #  redirect to ''
  #end

  get '/entities/:id' do  #loads show page
    @landlord = current_user.entities.find(params[:id])
    erb :'entities/show'
  end

  get '/entities/:id/edit' do #loads edit form
    @landlord = current_user.entities.find(params[:id])
    erb :'entities/edit'
  end

  patch '/entities/:id' do  #updates a property
    @landlord = current_user.entities.find(params[:id])
    @landlord.name = params[:name]
    @landlord.address = params[:address]
    @landlord.city = params[:city]
    @landlord.state = params[:state]
    @landlord.zip = params[:zip]
    @landlord.entity_type = params[:entity_type]
    @landlord.email = params[:email]
    @landlord.phone = params[:phone]
    @landlord.save
    redirect to "/entities/#{@landlord.id}"
  end

  post '/entities' do  #creates a property
    @landlord = current_user.entities.build(params)
    @landlord.save
    redirect to "/entities/#{@landlord.id}"
  end

  delete '/entities/:id' do #destroy action
    @landlord = Entity.find(params[:id])
    @landlord.destroy
    redirect to "/users/home"
  end
end 

