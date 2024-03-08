require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { player1: @game.player1, player2: @game.player2, winner: @game.winner } }, as: :json
    end

    assert_response :created
  end
end
