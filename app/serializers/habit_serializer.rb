class HabitSerializer < ActiveModel::Serializer
  attributes :id,:name

  
  has_many :user_habits
  

end