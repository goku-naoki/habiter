# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  def create
   
    #自動ログイン
    if params[:user][:email]=="guest@icloud.com"
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      redirect_to root_path and return
    end
  
    super do
      if request.format.json?
        render :json => {
          'status' => 'ok',
          'csrf_token' => form_authenticity_token,
          'result' => {
            'user' => {
              'id' => @user.id,
              'email' => @user.email,
              'nickname'=>@user.nickname,
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
  def new
    #guestyou！

    respond_to do |format|
      self.resource = resource_class.new(sign_in_params)
      clean_up_passwords(resource)
      format.html { render "home/redirect_form" }
    end
  end

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
