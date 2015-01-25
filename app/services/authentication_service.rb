class AuthenticationService
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def register
    user = User.create(params.merge(auth_token: AuthenticationService.generate_auth_token))

    if user.valid?
      user
    else
      # TODO: Add ErrorService later
      # return user.errors
    end
  end

  def check_user(auth_token)
    user = User.where(auth_token: auth_token).first
    if user.present?
      user
    else
      'wrong auth token' #Сообщение, если юзера нет
    end
  end

  def self.generate_auth_token
    loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(auth_token: random_token)
    end
  end
end