class Api::V1::LocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    binding.pry
    @data = get_trip(params[:location], params[:activity])
    render json: @data
  end



private

  def get_trip(location, activity)
    Yelp.client.search(location, {term: activity}, limit: 5)
  end

end
