class Location < ApplicationRecord
  validates :nickname, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :state, presence: true
  validates :business_name, presence: true
  validates :zipcode, presence: true
end
