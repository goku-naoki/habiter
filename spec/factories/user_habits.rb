FactoryBot.define do
  factory :user_habit do
    start_date {Date.today}
    association :user
    association :habit
  end
end