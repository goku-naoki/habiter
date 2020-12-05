FactoryBot.define do
  factory :done_habit do
    done_date {Date.today}
    association :user_habit
  end
end