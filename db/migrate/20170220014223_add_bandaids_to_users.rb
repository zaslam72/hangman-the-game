class AddBandaidsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bandaids, :integer, default: 3
  end
end
