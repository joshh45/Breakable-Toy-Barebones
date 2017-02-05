class Api::V1::UsersLocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @add_location = Location.create(name: params["AddName"], rating: params["AddRating"], cover_url: params["AddImgUrl"], address: params["AddAddress"], rating_img: params["AddRating_url"], url: params["AddUrl"])
    @user_locations_id = current_user.id
    # #gets user id
    @user_locations = UserLocation.new(user: current_user, location: Location.last)
      if @user_locations.save
      flash[:notice] = "Item is saved"
    end
  end

end
