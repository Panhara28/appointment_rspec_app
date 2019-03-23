class Client < ApplicationRecord
  #Validation
  validates :name, presence: true, length: { maximum: 20 }
  validates :address, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }

  #Association
  has_many :appointments
end
