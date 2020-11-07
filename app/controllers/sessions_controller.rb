# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  def create
    @user = current_user
    binding.pry
    super do
      if request.format.json?
        render :json => {
          'status' => 'ok',
          'csrf_token' => form_authenticity_token,
          'result' => {
            'user' => {
              'id' => @user.id,
              'email' => @user.email
            }
          }
        } and return
      end
    end
  end

  def destroy
    super do
      if request.format.json?
        render :json => {
          'csrf_param' => request_forgery_protection_token,
          'csrf_token' => form_authenticity_token
        }
        return
      end
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
