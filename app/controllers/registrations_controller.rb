# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  respond_to :json

  def create
    super do
      if request.format.json?
        unless !@user.errors.messages.empty?
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
        render :json => {
          'status' => 401,
          'errors'=>@user.errors
        } and return
      end
    end
  end


  def update
 
    super do
    
      unless  params[:user][:image]==nil || params[:user][:image].include?("active_storage") 
        @user.parse_base64(params[:user][:image])
      end

      if request.format.json?
        unless !@user.errors.messages.empty?
          render json: @user,include: { user_habits: [:habit] },serializer: UserSerializer and return
        end
      end
    end
    #userモデルでupdateをオーバーライド
   
  end





  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
