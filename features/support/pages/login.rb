class Login 
  include PageObject

  direct_url "http://www.facebook.com"

  text_field(:username, id: 'email')
  text_field(:password, id: 'pass')
  button(:submit, value: 'Log In')

  def login(user, pass)
    self.username = user
    self.password = pass
    submit
  end
end
