class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.integer :column
      t.integer :row
      t.integer :player
      t.integer :game_id

      t.timestamps
    end
  end
end
