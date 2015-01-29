class GameActivity < ActiveRecord::Base

  validates :game, :result, :step_activity, :user, presence: true

  #что бы Id был числом
  validates :game, :step_activity, numericality: { only_integer: true }
  #Попал или нет, первый игрок или нет
  validates :user, :result, inclusion: { in: [true,false] }
  #Значение может быть от 1 до 100, т.к. это значение ячейки 10 на 10
  validate :step_activity, numericality: { equal_to: 1..100 }

  belongs_to :game
end
