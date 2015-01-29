class CreateGameActivities < ActiveRecord::Migration
  def change
    create_table :game_activities do |t|
      t.references :game, index: true
      t.boolean :result #попал или нет
      t.integer :step_activity # куда стреляет
      t.boolean :user #true - первый игрок

      t.timestamps null: false
    end
  end
end
