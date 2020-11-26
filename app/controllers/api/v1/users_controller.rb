class Api::V1::UsersController < ApiController
  

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def show
    @user=User.find(params[:id])
    render json: @user,include: { habit_users: [:habit] },serializer: UserSerializer
  end

  def check_auth
    if user_signed_in?
      render :json => { auth:'login'}
    end
  end

  def get_user
    if user_signed_in?
      render :json => { user:current_user}
    end
  end

  def search
    
    if params[:keyword]==""
      return 
    end
    users=User.where(['nickname like ?',"%#{params[:keyword]}%"]).where.not(id:current_user.id)
    render json: users,each_serializer: UserSerializer
  end
end