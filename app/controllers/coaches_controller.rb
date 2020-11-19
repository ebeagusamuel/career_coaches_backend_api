class CoachesController < ApplicationController
  def index
    images = [];
    @coaches = Coach.all
    @coaches.each {|coach| images.push(rails_blob_path(coach.image)) }

    render json: {coaches: @coaches, images: images}, status: :ok
  end
end
