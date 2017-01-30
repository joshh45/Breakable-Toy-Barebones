class LocationsController < ApplicationController

  def index
    @location = params[:location]
    @activity = params[:activity]

    # if @location.nil?
    #   @message = "testing statements"
    # else
    #   @message = ""
    # end
    if @location.nil? && @activity.nil?
      @message = "hey"
    else
      @data = Yelp.client.search(@location, {term: @activity}, limit: 5)
      @data = @data.to_json
      @data_object = JSON.parse(@data)
      binding.pry
    end
  end

  def create
  end


end
