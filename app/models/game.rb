class Game < ApplicationRecord
  validates :player1, presence: true
  validates :player2, presence: true    
end
