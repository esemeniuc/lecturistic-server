class SchedulesController < ApplicationController

  # GET /schedules/:user_name
  def show
    binding.pry

    render params[:user_name]
  end
end
