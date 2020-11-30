class AppointmentsController < ApplicationController
  before_action :authorized

  def index
    @appointments = Appointment.where('user_id = ?', @user.id)

    render json: @appointments, status: :ok
  end

  def book_appointment
    req = @user.appointments.build(coach_id: params[:coach_id], date_and_time: params[:date])
    appointment = Appointment.where(user_id: @user.id, coach_id: params[:coach_id]).count
    coach_name = Coach.find_by(id: params[:coach_id]).name
    if appointment.positive?
      render json: { message: "You already have an appointment with #{coach_name}" }, status: :ok
    elsif req.save
      render json: { message: "Appointment with #{coach_name} created successfully." }, status: :created
    else
      render json: { error: req.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def cancel_appointment
    appointment = Appointment.where(user_id: @user.id, coach_id: params[:coach_id])
    coach_name = Coach.find_by(id: params[:coach_id]).name
    appointment.destroy_all
    render json: { message: "Your appointment with #{coach_name} has been cancelled", coach_id: params[:coach_id] }
  end
end
