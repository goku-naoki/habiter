class CreateDoneHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :done_habits do |t|

      t.date :done_date
      t.references :user_habit, foreign_key: true
      t.timestamps
    end
  end
end
