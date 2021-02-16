class PatientsController < ApplicationController

  # create 
  # POST: /patients
  post "/patients" do
    if !logged_in?
       redirect"/"
     end
        if !params.empty?
         
        nu_patient = Patient.create(params[:patient])
        nu_appointment = nu_patient.appointments.build(appointment_date: params[:appointment][:appointment_date], physician_id: current_phys.id)  
        nu_appointment.save
        redirect"/physicians/show" 
        else
          redirect "/patients/new"
        end
  end

  get '/patients' do
    erb :"/patients/show.html"
  end

  # GET: /patients/new
  get "/patients/new" do
    erb :"/patients/new.html"
  end


  # Update
  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    set_patient
    if logged_in?
      if @patient.physicians == current_phys
        erb :"/patients/edit.html"
      else 
        redirect"physicians/#{current_phys.id}"
      end
    else
      redirect'/'
    end
  end

  # PATCH: /patients/5
    patch "/patients/:id/edit" do
      set_patient
      if logged_in?
        if @appointment.physician == current_phys
          @patient.update(name: params[:name], address: params[:address], insurance: params[:insurance], age: params[:age])
           redirect "/patients/#{@patients.id}"
        else
          redirect "physicians/#{current_phys.id}"
        end
      else
        redirect "/"
      end
    end


  # Destroy

  # DELETE: /patients/5/delete
    delete "/patients/:id/delete" do
      set_patient
      if logged_in?
        @patient.delete && @patient.appointments.delete
        redirect "/physicians/#{current_phys.id}"
      else
      redirect "/physicians/#{current_phys.id}"  
      end
      
      
  end

end
