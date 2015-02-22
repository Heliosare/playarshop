class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, index: true
      t.string :nam
      t.string :description
      t.string :year

      t.timestamps
    end
  end
end
