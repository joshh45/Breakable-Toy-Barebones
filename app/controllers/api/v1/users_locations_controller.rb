class Api::V1::UsersLocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    binding.pry
  end

end
