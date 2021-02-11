class PhysiciansController < ApplicationController

  # Create
  # GET: /physicians/new
  get "/sign_up" do
    erb :"/physicians/new.html"
  end
  # GET: /physicians
  get "/physicians" do
    erb :"/physicians/index.html"
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
        redirect "/physicians/#{@phy_info.id}/show"
      end
    end
  end

# Read
  # GET: /physicians/5
  get "/physicians/:id" do
    # This is the show page
    current_phys.patients.all
    erb :"/physicians/show.html"
   
  end

  # Update
  # GET: /physicians/5/edit
  get "/physicians/:id/edit" do
    erb :"/physicians/edit.html"
  end

  # PATCH: /physicians/5
  patch "/physicians/:id/edit" do
    current_phys.update(name: params[:name], password: params[:password])
  end

  # Destroy
  # DELETE: /physicians/5/delete
  delete "/physicians/:id/delete" do
    redirect "/physicians"
  end

 
end

  