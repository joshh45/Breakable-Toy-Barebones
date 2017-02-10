class Api::V1::LocationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @data = get_trip(params[:location], params[:activity])
    render json: @data
  end

  def yelp_api_search
    @activity = yelp_search_params["activity"]
    @location = yelp_search_params["location"]
    @data = get_trip(@location, @activity).to_json
    @data = JSON.parse(@data)
    render json: @data
  end




private

  def yelp_search_params
    params.require(:yelp_search_params).permit(
      :activity,
      :location
    )
  end

  def get_trip(location, activity)
    Yelp.client.search(location, {term: activity}, limit: 8)
  end

end
