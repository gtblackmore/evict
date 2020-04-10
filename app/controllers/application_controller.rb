class ApplicationController < Sinatra::Base
  register Sinatra::Flash


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "testsecret"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= LandlordUser.find(session[:user_id]) if session[:user_id]
    end

    def authentication_required
      if !logged_in
        flash[:note] = "You must be logged in."
        redirect '/'
      end
    end
  end
end