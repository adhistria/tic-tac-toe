class Movement < ApplicationRecord
  belongs_to :game
  validate :uniq_position

  private

  def uniq_position
    if Movement.where(game_id: game_id, column: column, row: row).exists?
      errors.add(:base, "Position already taken in this game")
    end
  end
end
