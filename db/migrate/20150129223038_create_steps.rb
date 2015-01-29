class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :game, index: true
      t.boolean :user_type, default: nil
      t.string :ships_position

      t.timestamps null: false
    end
  end
end
