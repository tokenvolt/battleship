class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :first_user_id #First user id
      t.integer :second_user_id #Secon user id
      #Diffrent states of game duration
      t.string :status
      #Поле, в котором будет хранится длительность игры
      t.datetime :finished_at
      t.string :ships_position

      t.timestamps
    end

    #For relations with Users table
    add_index :games, :first_user_id
    add_index :games, :second_user_id
  end
end
