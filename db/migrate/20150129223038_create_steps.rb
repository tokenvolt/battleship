class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :game, index: true
      t.references :user, index: true

      t.boolean :result #попал или нет
      t.integer :step_activity # куда стреляет



      t.timestamps null: false
    end
  end
end
