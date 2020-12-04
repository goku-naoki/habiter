class ChangeHabitDonesToDoneHabits < ActiveRecord::Migration[6.0]
  def change
    rename_table :habit_dones, :done_habits
  end
end
