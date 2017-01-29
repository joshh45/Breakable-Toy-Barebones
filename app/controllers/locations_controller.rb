class LocationsController < ApplicationController

  def index
    @location = params[:location]
    @activity = params[:activity]
  end

  def create
  end


end
