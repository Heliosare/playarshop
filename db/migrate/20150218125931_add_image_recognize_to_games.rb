class AddImageRecognizeToGames < ActiveRecord::Migration
  def change
    add_column :games, :imageRecognize, :string
  end
end
