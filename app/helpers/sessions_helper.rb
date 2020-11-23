module SessionsHelper
  def current_user
    # session[:user2222]  => email
    if session[:user2222].present?
      @_user9487 ||= User.find_by(id: session[:user2222])
    end

  end

  
end