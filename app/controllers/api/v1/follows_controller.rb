class Api::V1::FollowsController < ApiController
  
  def create
   
   other_user=User.find(params[:user_id])
   current_user.follow(other_user)
   render json:other_user.followers,each_serializer:UserSerializer    #vueではshowuserのfolowerを比較する

  end

  def destroy 
    other_user=User.find(params[:user_id])
    current_user.unfollow(other_user)
    render json:other_user.followers,each_serializer:UserSerializer
  end


  


  
end