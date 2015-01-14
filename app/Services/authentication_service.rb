class AuthenticationService
  #Method for registration new user
  def register(email, nick, password, password_confirmation)
    if user = User.create(email: email, nick: nick, password: password, password_confirmation: password_confirmation)
      #Если успешно зарегистрировались, то как ты говорил, возвращаем самого юзера
      return user
    else
      #Я так понимаю, если он не создастья, то в юзере остануться ошибки с модели, верно же?
      return user.errors
    end
  end

  #Метод, который будет вызываться перед каждым запросом, что бы проверять auth_token
  def check_user(auth_token)
    user = User.where('auth_token = ?', auth_token).first
    if user.present?
      return user
    else
      return 'wrong auth token'
    end
  end
aa
end