class MovementsController < ApplicationController
  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      render json: @movement, status: :created
    else
      render json: @movement.errors, status: :unprocessable_entity
    end
  end

  def check_winner
    result = CheckWinner.new(params).call
    if result
      render json: result, status: :ok
    end
  end

  private
    def movement_params
      params.require(:movement).permit(:column, :row, :player, :game_id)
    end
end
