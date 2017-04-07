class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = current_user
    @user_location = UserLocation.all
    @locations = current_user.locations
    coordinates = @user.locations.map do |cord|
      {lat: cord["latitude"], long: cord["longitude"], name: cord["name"], url: cord["url"], address: cord["address"]}
    end
    @coordinates = JSON.unparse(coordinates)
  end


end
