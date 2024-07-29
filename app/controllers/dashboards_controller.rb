# frozen_string_literal: true

# This is a dashboard controller
class DashboardsController < ApplicationController
  def index
    @athletes = User.paginate(:page => params[:page])
  end
end
