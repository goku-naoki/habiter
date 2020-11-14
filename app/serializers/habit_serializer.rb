class HabitSerializer < ActiveModel::Serializer
  attributes :id,:name

  
  has_many :habit_users
  

end