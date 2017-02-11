require 'spec_helper'
require 'rails_helper'

describe UserLocation, type: :model do
  it { should have_valid(:user_id).when(1, 10) }
  it { should have_valid(:location_id).when(23, 432) }
  it { should have_valid(:favorite).when('true', 'false') }
end
