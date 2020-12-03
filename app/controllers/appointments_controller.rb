class AppointmentsController < ApplicationController
  before_action :authorized

  def index
    @appointments = Appointment.where('user_id = ?', @user.id)

    render json: @appointments, status: :ok
  end

  def create
    req = @user.appointments.build(coach_id: params[:coach_id],
                                   date_and_time: params[:date])
    if Appointment.for_user(@user.id, params[:coach_id]).count.positive?
      render json: { message: "You already have an appointment with
            #{Coach.coach_name(params[:coach_id])}" }, status: :ok
    elsif req.save
      render json: { message: "Appointment with
          #{Coach.coach_name(params[:coach_id])} created successfully." }, status: :created
    else
      render json: { error: req.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def destroy
    Appointment.for_user(@user.id, params[:coach_id]).destroy_all
    render json: { message: "Your appointment with #{Coach.coach_name(params[:coach_id])}
           has been cancelled" }, status: :ok
  end
end
