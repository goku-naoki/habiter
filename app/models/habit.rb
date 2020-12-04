class Habit < ApplicationRecord

  validates :name, presence: true
  has_many :habit_users
  has_many :users, through: :habit_users  
  
  
end
