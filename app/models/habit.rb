class Habit < ApplicationRecord

  validates :name, presence: true

  has_many :user_habits
  has_many :users, through: :habit_users  
  
  
end
