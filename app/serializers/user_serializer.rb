class UserSerializer < ActiveModel::Serializer
  attributes :id,:nickname,:email,:following,:followers

  has_many :habit_users
  

  def following
    binding.pry
    object.following
  end

  def followers
   
    object.followers
  end
  

end