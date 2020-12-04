class DoneHabitSerializer < ActiveModel::Serializer
  attributes :id,:user_habit_id,:done_date

  belongs_to :user_habit
  

end