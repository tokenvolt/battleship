class Step < ActiveRecord::Base

  validates :game, :user_type, :ships_position, presence: true #Все поля должны присутствовать
  validate :ships_position, length: { is: 100 } #длинна расстановочной комбинации (10*10)
  #что бы Id был числом
  validate :game, numericality: { only_integer: true }
  # если true - значит первый игрок, если false - второй
  # не плохо было бы тут метот создать, что бы можно было красиво обращаться
  # .first_user? - возвращает true можно так сделать? или это плохая идея?
  validate :user_type, inclusion: { in: [true,false] }

  belongs_to :game

end
