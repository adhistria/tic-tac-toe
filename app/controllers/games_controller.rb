class GamesController < ApplicationController
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:player1, :player2, :winner)
    end
end
