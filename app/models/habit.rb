class Habit < ApplicationRecord

  has_many :habit_users
  has_many :users, through: :habit_users  
  
end
