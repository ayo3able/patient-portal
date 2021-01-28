class PatientsController < ApplicationController

  # GET: /patients
  get "/patients" do
    erb :"/patients/index.html"
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
  get "/patients/:id" do
    erb :"/patients/show.html"
  end

  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    set_patient
    erb :"/patients/edit.html"
  end

  # PATCH: /patients/5
  patch "/patients/:id" do
    set_patient
    redirect "/patients/:id"
  end

  # DELETE: /patients/5/delete
  delete "/patients/:id/delete" do
    redirect "/patients"
  end


   # Method that finds a patient, appointment to a specific doctor
  # Method that finds all the patients of one doctor
end
