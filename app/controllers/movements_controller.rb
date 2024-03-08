class MovementsController < ApplicationController
  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      render json: @movement, status: :created, location: @movement
    else
      render json: @movement.errors, status: :unprocessable_entity
    end
  end

  private
    def movement_params
      params.require(:movement).permit(:column, :row, :player, :game_id)
    end
end
