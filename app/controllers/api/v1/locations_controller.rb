class Api::V1::LocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @data = get_trip(params[:location], params[:activity])
    render json: @data
  end

  def yelp_api_search
    binding.pry
  end




private

  def yelp_search_params
    params.require(:yelp_search_params).permit(
      :activity,
      :location
    )
  end

  def get_trip(location, activity)
    Yelp.client.search(location, {term: activity}, limit: 5)
  end

end
