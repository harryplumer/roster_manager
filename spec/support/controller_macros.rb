module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(email: 'commish@nfl.com', password: 'deflate', 
      first_name: 'Roger', last_name: 'Goodell', age: 59)
      sign_in @user
    end
  end
end