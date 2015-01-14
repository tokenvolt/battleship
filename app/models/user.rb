class User < ActiveRecord::Base
  before_create :generate_auth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      uniqueness: {case_sensitive: false},
                      presence: true
  #nick_name
  validates :nick_name, presence: true, length: {minimum: 2}
  #For generating password
  # has_secure_password

  #For generating auth token when user creating
  def generate_auth_token
    self.auth_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(auth_token: random_token)
    end
  end
end
