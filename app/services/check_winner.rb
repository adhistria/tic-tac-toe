class CheckWinner
  def initialize(params)
    @game_id = params[:game_id]
    @player = params[:player]
  end

  def call
    winner = nil
    moves = Movement.where(game_id: @game_id, player: @player)
    winning_combinations = [
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]] 
    ]

    winning_combinations.any? do |combination|
      if combination.all? { |column, row| moves.exists?(column: column, row: row) }
        @winner = @player
      end
    end

    if @winner.present?
      {
        "status": "success",
        "winner": @winner,
        "message": "Player #{@player} win!"
      }
    else
      {
        "status": "success",
        "winner": "none",
      }
    end
  end
end