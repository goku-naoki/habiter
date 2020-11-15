class CreateHabitDones < ActiveRecord::Migration[6.0]
  def change
    create_table :habit_dones do |t|

      t.date :done_date
      t.references :habit_user, foreign_key: true
      t.timestamps
    end
  end
end