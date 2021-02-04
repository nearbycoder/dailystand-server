# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  has_many :subtasks, dependent: :destroy
  belongs_to :user
end
