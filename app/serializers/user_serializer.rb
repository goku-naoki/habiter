class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,:nickname,:email,:following,:followers,:photo

  has_many :user_habits
  

  def following
   
    object.following
  end

  def followers
    object.followers
  end
  
  def photo
   url_for(object.avatar) if object.avatar.attached?
  end

end