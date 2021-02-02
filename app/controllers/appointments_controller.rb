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
    
    if !logged_in?
      redirect '/'
    end
    if params[:appointment_date] && params[:appt_time] != ""
      @appointment = Appointment.create(appointment_date: params[:appointment_date],
      physician_id: current_phys.id)
      redirect "/appointments/#{@appointment.id}"
    else
      redirect '/appointments/new'
    end
  end

  # GET: /appointments/5
  get "/appointments/:id" do
    set_appointment
    erb :"/appointments/show.html"
  end
  
 

  # GET: /appointments/5/edit
  get "/appointments/:id/edit" do
    set_appointment
    if logged_in?
      if @appointment.physician_id == current_phys
    erb :"/appointments/edit.html"
      else 
        redirect"physician/#{current_phys.id}"
      end
    else
        redirect '/'
      end
    end

  # PATCH: /appointments/5
  patch "/appointments/:id" do
    set_appointment
    if logged_in?
      if @appointment.physician_id == current_phys
    @appointment.update(appointment_date: params[:appointment_date])
    redirect "/appointments/#{@appointment.id}"
      else
        redirect "physicians/#{current_phys.id}"
      end
    else
      redirect "/"
    end
  end

  # DELETE: /appointments/5/delete
  delete "/appointments/:id/delete" do
    @appointment.delete
    redirect "/physicians/show.html"
  end
  

end
