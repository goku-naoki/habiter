class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|

      t.text :name
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end