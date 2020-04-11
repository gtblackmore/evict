class PropertiesController < ApplicationController
  before '/properties/*' do
    authentication_required
  end

  get '/properties/new' do #loads new form
    @landlord = Entity.all
    erb :'properties/new'
  end

  #get '/properties' do #loads index page
  #  @property = Property.all
  #  erb :index
  #end

  get '/properties/:id' do  #loads show page
    @property = Property.find_by(params[:id])
    erb :'properties/show'
  end

  get '/properties/:id/edit' do #loads edit form
    @property = Property.find_by(params[:id])
    erb :'properties/edit'
  end

  patch '/properties/:id' do  #updates a property
    @property = Property.find_by(params[:id])
    @property.address = params[:address]
    @property.city = params[:city]
    @property.state = params[:state]
    @property.zip = params[:zip]
    @property.county = params[:county]
    @property.rent = params[:rent]
    @property.entity_id = params[:entity_id]
    @property.save
    redirect to '/properties/#{@property.id}'
  end

  post '/properties' do  #creates a property
    @property = Property.create(params)
    redirect to '/properties/#{@property.id}'
  end

  delete '/properties/:id' do #destroy action
    @property = Property.find_by(params[:id])
    @property.delete
    redirect to '/'
  end
end 