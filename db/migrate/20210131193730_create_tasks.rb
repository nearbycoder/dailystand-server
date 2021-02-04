# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description, null: true
      t.references :project, null: false, foreign_key: true
      t.datetime :completed_at, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
