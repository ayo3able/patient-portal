require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "flowers"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    if logged_in?
      redirect "/physicians/#{current_phys.id}"
    else
    erb :welcome
    end
  end

  get "/log_in" do
    erb :log_in
  end

  post "/log_in" do
   phy_find = Physician.find_by(name: params[:name])
   if phy_find && phy_find.authenticate(params[:password])
    session[:physician_id] = phy_find.id
     redirect "/physicians/#{phy_find.id}"
     
   else
    redirect "/sign_up" 
   end
   
  end

  get '/patients/show' do
    erb :"/patients/show.html"
  end

  get "/log_out" do
    session.clear
    redirect "/"
  end

  post '/appointments' do
    "Hello World"
  end
 

  helpers do

    def logged_in?
      !!current_phys
    end

    def current_phys
      @current_phys = Physician.find_by(id: session[:physician_id]) if session[:physician_id]
    end

    def set_appointment
      @appointment = Appointment.find_by(id: params[:id])
      
    end

    def set_patient
      @patient = Patient.find_by(id: params[:id])
    end

    def set_physician
      @phy = Physician.find_by(id: params[:id])
    end

  
  

  end
  

end
