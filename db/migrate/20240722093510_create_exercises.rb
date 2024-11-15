# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.integer :duration_in_min
      t.text :workout
      t.date :workout_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
