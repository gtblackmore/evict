class PropertiesController < ApplicationController
  before '/properties/*' do
    authentication_required
  end

  get '/properties/new' do #loads new form
    @landlord = current_user.entities
    erb :'properties/new'
  end

  #get '/properties' do #loads index page
  #  @unit = Property.all
  #  erb :index
  #end

  #get '/properties/:id' do  #loads show page
  #  @unit = Property.find(params[:id])
  #  erb :'properties/show'
  #end

  get '/properties/:id/edit' do #loads edit form
    @unit = current_user.properties.find(params[:id])
    @landlord = current_user.entities
     
      erb :'properties/edit'
    
  end

  patch '/properties/:id' do  #updates a property
    @unit = Property.find(params[:id])
    @unit.address = params[:address]
    @unit.city = params[:city]
    @unit.state = params[:state]
    @unit.zip = params[:zip]
    @unit.county = params[:county]
    @unit.rent = params[:rent]
    @unit.entity_id = params[:entity_id]
    @unit.save
    redirect to "/properties/#{@unit.id}"
  end

  post '/properties' do  #creates a property
    @unit = Property.create(params)
    redirect to "/users/home"
  end

  delete '/properties/:id' do #destroy action
    @unit = Property.find(params[:id])
    @unit.destroy
    redirect to "/users/home"
  end
end 