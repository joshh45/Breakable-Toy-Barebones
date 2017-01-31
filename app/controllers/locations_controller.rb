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
    end
    @locations_data = []
    data = Location
  end

  def create
    # value = params
    @add_location = Location.new(name: params["name"], rating: params["rating"], cover_url: params["cover_url"], address: params["address"], rating_img: params["rating_img_url"], url: params["url"])
    if @add_location.save
      flash[:notice] = "Your item was saved!"
    end
  end
end
