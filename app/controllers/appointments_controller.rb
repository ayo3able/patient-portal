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
    #create new appointment and save into DB
    #Only want to create an appointment if a Physician is logged in
    #save only if appointment has a time and a date
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
