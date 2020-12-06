class DoneHabit < ApplicationRecord
  self.ignored_columns = %w(user_habit_id)
  validates :done_date,presence: true
  belongs_to :user_habit
  
end
