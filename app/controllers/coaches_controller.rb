class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
    
    render json: @coaches
  end
end
