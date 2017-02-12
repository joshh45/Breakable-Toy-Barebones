require "rails_helper"
require 'pry'

RSpec.describe Api::V1::LocationsController, type: :controller do
    describe "GET #index" do
      it "should return the correct location and activity" do
        get :index, params: { location: 'Malden', activity: 'food' }
        json = JSON.parse(response.body)
        expect(json['businesses'][0]['name']).to eq('Mystic Station')
        expect(json['businesses'][1]['name']).to eq('El Potro Mexican Grill')
        expect(json['businesses'][2]['name']).to eq('Pisa Pizza')
      end
    end
    describe "GET" "index" do
      it "should return 8 items to be displayed" do
        get :index, params: { location: 'Malden', activity: 'food' }
        json = JSON.parse(response.body)
        expect(json['businesses'].length).to eq(8)
      end
    end
    describe "GET" "index" do
      it "should expect return output to contain specified location" do
        get :index, params: { location: 'Malden', activity: 'food' }
        json = JSON.parse(response.body)
        expect(json['businesses'][0]['location']['city']).to eq('Malden')
        expect(json['businesses'][1]['location']['city']).to eq('Malden')
        expect(json['businesses'][2]['location']['city']).to eq('Malden')
      end
    end
end
