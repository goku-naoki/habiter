class Api::V1::UsersController < ApiController
  

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def check_auth
    if user_signed_in?
      render :json => { auth:'login'}
    end
  end
end