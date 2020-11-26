class UserSerializer < ActiveModel::Serializer
  attributes :id,:nickname,:email

  has_many :habit_users
  

end