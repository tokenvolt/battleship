class Step < ActiveRecord::Base

  validates :game, :user, :ships_position, :result, :step_activity, presence: true #Все поля должны присутствовать
  validate :ships_position, length: { is: 100 } #длинна расстановочной комбинации (10*10)
  #что бы game, user были числами
  validate :game, :user, numericality: { only_integer: true }

  belongs_to :game

end
