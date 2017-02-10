class UsersController < ApplicationController

  def show
    @user = current_user
    @user_location = UserLocation.all
    @locations = current_user.locations
    coordinates = @user.locations.map do |cord|
      {lat: cord["latitude"], long: cord["longitude"], name: cord["name"], url: cord["url"], address: cord["address"]}
    end
    @coordinates = JSON.unparse(coordinates)
  end

  # def destroy
  #   @location = Location.find(params[:id])
  #   @location.destroy
  #   redirect_to user_path
  # end
end
