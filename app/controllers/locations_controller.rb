class LocationsController < ApplicationController

  def index
    @location = params[:location]
    @activity = params[:activity]

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
    @add_location = Location.create(name: params["name"], rating: params["rating"], cover_url: params["cover_url"], address: params["address"], rating_img: params["rating_img_url"], url: params["url"])
    #creating the location
    @user_locations_id = current_user.id
    #gets user id
    @user_locations = UserLocation.new(user: current_user, location: Location.last)
      if @user_locations.save
      flash[:notice] = "Item is saved"
    # if @add_location.save
    #   flash[:notice] = "Your item was saved!"
    #   current_user
      end
    end


  def update
    @hey = params
    @userlocation = UserLocation.find_by(user_id: @hey['id'], location_id: @hey['location_id'])
      if @userlocation.favorite == false
        @userlocation.favorite = true
        @userlocation.save
      end
    redirect_to user_path
  end


  def destroy
    # @user = current_user.id
    @location = Location.find(params[:location_id])
    @userlocation = UserLocation.find_by(user_id: current_user.id, location_id: params[:location_id]).destroy
    redirect_to user_path
  end


end
