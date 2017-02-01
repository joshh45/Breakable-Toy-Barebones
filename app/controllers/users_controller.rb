class UsersController < ApplicationController

  def show
    @user = current_user
    @user_location = UserLocation.all
    @locations = current_user.locations
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to user_path
  end

end
