class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller? 

  def configure_permitted_paramaters ## 追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
