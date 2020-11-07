class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller? 
  protect_from_forgery with: :exception
  
  def configure_permitted_paramaters ## 追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
