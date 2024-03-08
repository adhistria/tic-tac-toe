require "test_helper"

class MovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movement = movements(:one)
  end

  test "should create movement" do
    assert_difference("Movement.count") do
      post movements_url, params: { movement: { column: @movement.column, game_id: @movement.game_id, player: @movement.player, row: @movement.row } }, as: :json
    end

    assert_response :created
  end
end
