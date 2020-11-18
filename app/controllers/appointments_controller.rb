class AppointmentsController < ApplicationController
  # before_action :authorized

  def index
    @appointments = Appointment.current_user(@user)

    render json: @appointments
  end

  def book_appointment
    req = @user.appointments.build(coach_id: params[:coach_id])
    if req.save
      render json: {message: "Appointment created successfully"}, status: :created
    else
      render json: {message: "Unable to create an appointment", error: req.errors.full_messages.to_sentence}
    end
  end

  def cancel_appointment
    appointment = Appointment.where(user_id: @user.id, coach_id: params[:coach_id])
    coach_name = Coach.find_by(id: params[:coach_id]).name
    appointment.destroy_all
    render json: {message: "Your appointment with #{coach_name} has been cancelled}"}
  end

end
