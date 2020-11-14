class HabitDoneSerializer < ActiveModel::Serializer
  attributes :id,:habit_user_id,:done_date

  belongs_to :habit_user
  

end