class PatientsController < ApplicationController

  # create 
  # POST: /patients
  post "/patients" do
    if !logged_in?
       redirect"/"
     end
        if !params.empty?
        nu_patient = Patient.create(name: params[:name], address: params[:address], insurance: params[:insurance], age: params[:age])
        nu_appointment = nu_patient.appointments.build(appointment_date: params[:appointment_date], physician_id: current_phys.id)  
        redirect"/physicians/show" 
        else
          redirect "/patients/new"
        end
  end

  # GET: /patients/new
  get "/patients/new" do
    erb :"/patients/new.html"
  end


  # Read
  # POST: /patients
  post "/patients/" do
    if logged_in?
      current_phys.patients.all
     else
      redirect"/"
    end
  end

  # GET: /patients/5
  get "/patients" do
     erb :"/patients/show.html" 
  end


  # Update
  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    set_patient
    if logged_in?
      if @patient.physicians == current_phys
     erb :"/patients/edit.html"
  else
    redirect'/'
  end
  end
end
  # PATCH: /patients/5
  patch "/patients/:id/edit" do
    set_patient
      @patient.update(name: params[:name], address: params[:address], insurance: params[:insurance], age: params[:age])
    redirect "/physicians/show.html"
  end

  # Destroy

  # DELETE: /patients/5/delete
    delete "/patients/:id/delete" do
      set_patient
      if logged_in?
        @patient.delete && @patient.appointments.delete
        redirect "/physicians/show.html"
      else
      redirect "/physicians/show.html"  
      end
      
      
  end

end
