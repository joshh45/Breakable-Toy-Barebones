require 'spec_helper'
require 'rails_helper'


describe Location, type: :model do
  it { should have_valid(:name).when("Mcdonalds") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:rating).when("4") }
  it { should_not have_valid(:rating).when(nil, '') }

  it { should have_valid(:address).when("12 Spring Street, Malden Ma") }
  it { should_not have_valid(:address).when(nil, '') }
  
  it { should have_valid(:cover_url).when("1209sajdsjak09.jpq") }
  it { should_not have_valid(:cover_url).when(nil, '') }
end
