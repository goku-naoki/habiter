class HabitUser < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  has_many :habit_dones
end
