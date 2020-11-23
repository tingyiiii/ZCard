class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # 原型=> rescue_from(ActiveRecord::RecordNotFound, {with: :record_not_found})

  private
  def record_not_found
    render file: 'public/404.html', layout: false, status: 404
  end
  
end
