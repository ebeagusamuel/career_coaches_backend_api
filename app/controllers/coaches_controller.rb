class CoachesController < ApplicationController
  def index
    images = []
    @coaches = Coach.all
    @coaches.each { |coach| images.push({ image: rails_blob_path(coach.image), coach_id: coach.id }) }

    render json: { coaches: @coaches, images: images }, status: :ok
  end
end
