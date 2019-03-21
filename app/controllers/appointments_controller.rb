class AppointmentsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @appointment = Appointment.new
    if @appointment.save
      redirect_to appointment_path(@appointment)
      flash[:notice] = "Appointment was successfully created"
    else
      render :new
    end
  end

  def edit

  end

  def update
    @appointment = Appointment.find(params[:id])
    redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    redirect_to appointments_path
  end
  
end
