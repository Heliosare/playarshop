class AddLogoToGames < ActiveRecord::Migration
  def change
    add_column :games, :logo, :string
  end
end
