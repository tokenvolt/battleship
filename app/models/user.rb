class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      uniqueness: {case_sensitive: false},
                      presence: true
  #nick_name
  validates :nick_name, presence: true, length: {minimum: 2}



end
