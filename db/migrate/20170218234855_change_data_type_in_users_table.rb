class ChangeDataTypeInUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :games_won, :float
  end
end
