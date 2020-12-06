class DoneHabit < ApplicationRecord

  validates :done_date,presence: true
  belongs_to :user_habit
  
end
