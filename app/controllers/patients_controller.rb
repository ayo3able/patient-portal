class PatientsController < ApplicationController

  
  # POST: /patients
  post "/patients/:id/new" do
    if !logged_in?
      redirect"/"
    end
    erb :"/patients/new.html"
  
  end

  # GET: /patients/new
  get "/patients/new" do
    erb :"/patients/new.html"
  end

  # POST: /patients
  post "/patients" do
    redirect "/patients"
  end

  # GET: /patients/5
  get "/patients" do
    @patient = current_phys.patients.all
    erb :"/patients/show.html"
  end

  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    set_patient
    if logged_in?
    if @patient.physicians == current_phys
     erb :"/patients/edit.html"
    else
      redirect "/physicians/#{current_phys.id}"
    end
  else
    redirect'/'
  end
  end

  # PATCH: /patients/5
  patch "/patients/:id" do
    set_patient
      @patient.update(name: params[:name], address: params[:address], insurance: params[:insurance], age: params[:age])
    redirect "/patients/#{@patient.id}"
  end

  # DELETE: /patients/5/delete
    delete "/patients/:id/delete" do
      @patient.delete
      redirect "/physicians/show.html"
  end

end
