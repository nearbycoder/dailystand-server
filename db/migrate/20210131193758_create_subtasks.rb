# frozen_string_literal: true

class CreateSubtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :subtasks do |t|
      t.string :name
      t.text :description, null: true
      t.references :task, null: false, foreign_key: true
      t.datetime :completed_at, null: true
      t.timestamps
    end
  end
end
