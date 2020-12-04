class UserHabit < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  has_many :habit_dones, dependent: :destroy
end
