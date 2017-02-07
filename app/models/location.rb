class Location < ApplicationRecord
    validates :name, presence: true
    validates :rating, presence: true
    validates :cover_url, presence: true
    validates :address, presence: true

    has_many :user_locations
    has_many :users, through: :user_locations

    geocoded_by :address
    after_validation :geocode
end
