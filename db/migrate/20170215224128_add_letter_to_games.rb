class AddLetterToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :letter, :string
  end
end
