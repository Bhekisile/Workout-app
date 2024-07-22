# frozen_string_literal: true

# This is an exercises controller
class ExercisesController < ApplicationController
  def index; end

  def new
    @exercise = current_user.exercises.new
  end
end
