class PhysiciansController < ApplicationController

  # GET: /physicians
  get "/physicians" do
    erb :"/physicians/index.html"
  end

  # GET: /physicians/new
  get "/physicians/new" do
    erb :"/physicians/new.html"
  end

  # POST: /physicians
  post "/physicians" do
    redirect "/physicians"
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
