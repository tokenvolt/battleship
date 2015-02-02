class Game < ActiveRecord::Base
  include AASM

  status do
    state :prepare, initial: true #расставляют свои корабли
    state :process #идет игра
    state :first_user_win #первый выиграл
    state :second_user_win #второй выиграл
  end

  #Validations
  validates :first_user_id, :second_user_id,
            presence: true, numericality: { only_integer: true }

  #Как правильно провалидировать status?
  #Т.к. у нас немного нестандартная ситуация, так будет норм?
  belongs_to :first_user, class_name: User, foreign_key: :first_user_id
  belongs_to :second_user, class_name: User, foreign_key: :second_user_id
  has_many :steps
end
