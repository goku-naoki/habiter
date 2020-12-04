class RenameUserHabitIdColumnToDoneHabits < ActiveRecord::Migration[6.0]
  def change
    rename_column :done_habits, :habit_user_id, :user_habit_id
  end
end
