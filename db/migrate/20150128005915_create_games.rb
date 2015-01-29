class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :first_user_id #First user id
      t.integer :second_user_id #Secon user id
      #Diffrent states of game duration
      t.integer :status, default: 0 #Good practice is to let the first declared status be the default. верно?
      #Tru if first_user won; false if second_ser won
      t.boolean :result, default: nil
      #Поле, в котором будет хранится длительность игры, правильно ли его делать time, или лучше все таки timestemp и в чем разница
      t.time :playing_time

      t.timestamps
    end

    #For relations with Users table
    add_index :games, :first_user_id
    add_index :games, :second_user_id
  end
end
