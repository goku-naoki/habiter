class Api::V1::FollowsController < ApiController
  
  def create
   binding.pry
   other_user=User.find(params[:user_id])
   current_user.follow(other_user)
  end

  def destroy 

  end


  
end