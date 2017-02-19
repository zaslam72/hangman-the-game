class AddUserwordToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_word, :string
  end
end
