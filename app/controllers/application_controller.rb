class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # 原型=> rescue_from(ActiveRecord::RecordNotFound, {with: :record_not_found})

  private
  def session_required
    redirect_to new_user_registration_path, notice: '請先登入會員' unless user_sign_in?
  end
  
  def record_not_found
    render file: 'public/404.html', layout: false, status: 404
  end
  
end
