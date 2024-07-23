# frozen_string_literal: true

# This is the exercise model
class Exercise < ApplicationRecord
  belongs_to :user
end
