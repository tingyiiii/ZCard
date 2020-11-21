module SessionsHelper
  def current_user
    # session[:user2222]  => email

    # if session[:user2222].present?
    #   @user ||= User.find_by(email: session[:user2222])
    # end

    @user ||= User.find_by(email: session[:user2222])
  end
end