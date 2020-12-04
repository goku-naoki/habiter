class UserSerializer < ActiveModel::Serializer
  attributes :id,:nickname,:email,:following,:followers

  has_many :user_habits
  

  def following
   
    object.following
  end

  def followers
   
    object.followers
  end
  

end