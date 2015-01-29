class Game < ActiveRecord::Base

  enum status: [ :preparation, :process, :finished ]


  #Validations
  validates :first_user_id, :second_user_id,
            presence: true, numericality: { only_integer: true }
  #Правильно ли так валидировать логические переменные? и нужно ли их вообще валидировать?
  validates :result, inclusion: { in: [true,false] }

  #Как правильно провалидировать status?
  #Нужно ли делать валидации для поля playing_time (поле типа Time)
  #Т.к. у нас немного нестандартная ситуация, так будет норм?
  belongs_to :user, class_name: User, foreign_key: :first_user_id
  belongs_to :user, class_name: User, foreign_key: :second_user_id
  has_many :steps
  has_many :game_activities
end
