class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :word
      t.string :guesses
      t.integer :remaining_guesses, default: 6
      t.integer :user_id

      t.timestamps
    end
  end
end
