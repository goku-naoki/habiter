class UserHabit < ApplicationRecord

  validates :start_date,presence: true

  belongs_to :habit
  belongs_to :user
  has_many :done_habits, dependent: :destroy
end
