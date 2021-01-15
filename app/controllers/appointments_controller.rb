class AppointmentsController < ApplicationController

  # GET: /appointments
  get "/appointments" do
    erb :"/appointments/index.html"
  end

  # GET: /appointments/new
  get "/appointments/new" do
    erb :"/appointments/new.html"
  end

  # POST: /appointments
  post "/appointments" do
    redirect "/appointments"
  end

  # GET: /appointments/5
  get "/appointments/:id" do
    erb :"/appointments/show.html"
  end

  # GET: /appointments/5/edit
  get "/appointments/:id/edit" do
    erb :"/appointments/edit.html"
  end

  # PATCH: /appointments/5
  patch "/appointments/:id" do
    redirect "/appointments/:id"
  end

  # DELETE: /appointments/5/delete
  delete "/appointments/:id/delete" do
    redirect "/appointments"
  end
end
