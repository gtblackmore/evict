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
    @landlord = Entity.find_by(params[:id])
    erb :'entities/show'
  end

  get '/entities/:id/edit' do #loads edit form
    @landlord = Entity.find_by(params[:id])
    erb :'entities/edit'
  end

  patch '/entities/:id' do  #updates a property
    @landlord = Entity.find_by(params[:id])
    @landlord.name = params[:company_name]
    @landlord.address = params[:company_address]
    @landlord.city = params[:company_city]
    @landlord.state = params[:company_state]
    @landlord.zip = params[:company_zip]
    @landlord.type = params[:type]
    @landlord.email = params[:email]
    @landlord.phone = params[:phone]
    @landlord.save
    redirect to '/entities/#{@landlord.id}'
  end

  post '/entities' do  #creates a property
    @landlord = Entity.create(params)
    redirect to '/entities/#{@landlord.id}'
  end

  delete 'entities/:id' do #destroy action
    @landlord = Entity.find_by(params[:id])
    @landlord.delete
    redirect to '/entities/show'
  end
end 

