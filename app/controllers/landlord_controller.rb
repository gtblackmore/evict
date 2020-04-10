class LandlordController < ApplicationController
  before '/landlords/*' do
    authentication_required
  end

  get '/landlords/new' do #loads new form
    erb :'landlords/new'
  end

  #get '/landlords' do #loads index page
  #  redirect to ''
  #end

  get '/landlords/:id' do  #loads show page
    @landlord = Landlord.find_by(params[:id])
    erb :'landlords/show'
  end

  get '/landlords/:id/edit' do #loads edit form
    @landlord = Landlord.find_by(params[:id])
    erb :'landlords/edit'
  end

  patch '/landlords/:id' do  #updates a property
    @landlord = Landlord.find_by(params[:id])
    @landlord.company_name = params[:company_name]
    @landlord.company_address = params[:company_address]
    @landlord.company_city = params[:company_city]
    @landlord.company_state = params[:company_state]
    @landlord.company_zip = params[:company_zip]
    @landlord.contact_first_name = params[:contact_first_name]
    @landlord.contact_last_name = params[:contact_last_name]
    @landlord.contact_email = params[:contact_email]
    @landlord.contact_phone = params[:contact_phone]
    @landlord.save
    redirect to '/landlords/#{@landlord.id}'
  end

  post '/landlords' do  #creates a property
    @landlord = Landlord.create(params)
    redirect to '/landlords/#{@landlord.id}'
  end

  delete '/landlords/:id' do #destroy action
    @landlord = Landlord.find_by(params[:id])
    @landlord.delete
    redirect to '/'
  end
end 

