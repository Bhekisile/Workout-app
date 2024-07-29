# frozen_string_literal: true

# This is a dashboard controller
class DashboardsController < ApplicationController
  def index
    @athletes = User.all
  end
end
