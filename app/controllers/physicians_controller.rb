class PhysiciansController < ApplicationController

  # GET: /physicians
  get "/physicians" do
    erb :"/physicians/index.html"
  end

  # GET: /physicians/new
  get "/sign_up" do
    erb :"/physicians/new.html"
  end

  # POST: /physicians
  post "/physicians" do
   
    if params[:name] == "" && params[:password] == ""
      redirect "/sign_up"
    else
      if Physician.find_by(name: params[:name])
        redirect "/log_in"
      else
        phy_info = Physician.create(name: params[:name], password: params[:password])
        session[:physician_id] = phy_info.id
        redirect "/physicians/#{Physician.id}"
      end
    end
  end

  get "/physicians/:id" do
    "This will be the users show route"
  end

  # GET: /physicians/5
  get "/physicians/:id" do
    erb :"/physicians/show.html"
  end

  # GET: /physicians/5/edit
  get "/physicians/:id/edit" do
    erb :"/physicians/edit.html"
  end

  # PATCH: /physicians/5
  patch "/physicians/:id" do
    redirect "/physicians/:id"
  end

  # DELETE: /physicians/5/delete
  delete "/physicians/:id/delete" do
    redirect "/physicians"
  end
end
