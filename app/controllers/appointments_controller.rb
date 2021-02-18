class AppointmentsController < ApplicationController

# create 

  # GET: /appointments/new
  get "/appointments/new" do
    erb :"/appointments/new.html"
  end

  # POST: /appointments
  post "/appointments" do
    if !logged_in?
      redirect '/'
    end
    if params[:appointment_date] !="" && params[:patient_id] != ""
      @appointment = Appointment.create(appointment_date: params[:appointment_date],
      patient_id: params[:patient_id],
      physician_id: current_phys.id)
      redirect "/physicians/#{current_phys.id}"
    else
      redirect '/appointments/new'
    end
  end
 
  # Read
  # GET: /appointments/5
  get "/appointments" do
    @appointments = Appointment.find_by(id: params[:id])
    erb :"/appointments/show.html"
  end

  
 
# Update
  # GET: /appointments/5/edit
  get "/appointments/:id/edit" do
    set_appointment
    if logged_in?
       erb :"/appointments/edit.html"
    else
      redirect '/'
    end
  end

  # PATCH: /appointments/5
  patch "/appointments/:id/edit" do
    set_appointment
    if logged_in?
      if @appointment.physician.id == (current_phys.id)
        @appointment.update(appointment_date: params[:appointment_date])
        redirect "physicians/#{current_phys.id}"
      end
    else
      redirect "/"
    end
  end

  # Destroy

  # DELETE: /appointments/5/delete
  delete "/appointments/:id/delete" do
    set_appointment
    if logged_in?
     @appointment.delete 
     redirect "/physicians/show.html"
    else
     redirect "/physicians/show.html" 
    end
    
    
  end
  

end
