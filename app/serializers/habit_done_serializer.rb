class HabitDoneSerializer < ActiveModel::Serializer
  attributes :id,:habit_id,:user_id,:done_date

  belongs_to :habit
  

end