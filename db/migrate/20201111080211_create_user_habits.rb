class CreateUserHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :user_habits do |t|

      t.date :start_date
      t.references :user, foreign_key: true
      t.references :habit, foreign_key: true
      t.timestamps
    end
  end
end
