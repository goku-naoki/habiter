class Habit < ApplicationRecord

  has_many :user_habits
  has_many :users, through: :habit_users  
  
  
end
