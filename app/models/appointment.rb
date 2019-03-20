class Appointment < ApplicationRecord
  validates :appointment_date, presence: true
  validates :price, presence: true, numericality: true
  validates :duration, presence: true, numericality: { only_integer: true }
end
