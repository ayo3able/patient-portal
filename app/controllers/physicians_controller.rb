class PhysiciansController < ApplicationController

  # Create
  # GET: /physicians/new
  get "/sign_up" do
    erb :"/physicians/new.html"
  end


  # POST: /physicians logging in
  post "/physicians" do
   
    if params[:name] == "" && params[:password] == ""
      redirect "/sign_up"
    else
      if Physician.find_by(name: params[:name])
        redirect "/log_in"
      else
        phy_info = Physician.create(name: params[:name], password: params[:password])
        session[:physician_id] = phy_info.id
        redirect "/physicians/#{@phy_info.id}"
      end
    end
  end

# Read
  # GET: /physicians/5
  get "/physicians/:id" do
    # This is the show page
    @patients = current_phys.patients
    erb :"/physicians/show.html"
   
  end

  # Update
  # GET: /physicians/5/edit
  get "/physicians/:id/edit" do
    if logged_in?
      if current_phys.id
        erb :"/physicians/edit.html"
      else
        redirect "/physicians/#{current_phys.id}"
      end
    else
        redirect '/'
    end
    
  end

  # PATCH: /physicians/5
  patch "/physicians/:id/edit" do
    if logged_in?
      if current_phys.id
        current_phys.update(name: params[:name], username: params[:username], password: params[:password])
      else
        redirect "physicians/#{current_phys.id}"
      end
    else
      redirect '/'
    end
  end

  # Destroy
  # DELETE: /physicians/5/delete
  delete "/physicians/:id/delete" do
    redirect "/physicians"
  end

 
end

  