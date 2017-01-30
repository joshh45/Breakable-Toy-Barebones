class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: { message: "Username is already in use" }
  validates :name, presence: true

  has_many :user_locations
  has_many :locations, through: :user_locations
end
