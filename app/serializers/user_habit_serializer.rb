class UserHabitSerializer < ActiveModel::Serializer
  attributes :id,:habit_id,:user_id,:start_date
  

  belongs_to :habit
  has_many :done_habits

  

end