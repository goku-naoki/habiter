class UserHabit < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  has_many :done_habits, dependent: :destroy
end
