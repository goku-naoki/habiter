class ChangeHabitUsersToUserHabits < ActiveRecord::Migration[6.0]
  def change
    rename_table :habit_users, :user_habits
  end
end
