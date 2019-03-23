require 'rails_helper'

RSpec.describe Appointment, type: :model do

  context "Appointment's attributes" do
    it{ should have_db_column(:appointment_date).of_type(:datetime) }
    it{ should have_db_column(:duration).of_type(:integer) }
    it{ should have_db_column(:price).of_type(:float) }
  end

  context "Appointment's validation" do
    it{ should validate_presence_of(:appointment_date) }
    it{ should validate_presence_of(:duration) }
    it{ should validate_presence_of(:price) }

    it{ should validate_numericality_of(:price)}
    it{ should validate_numericality_of(:duration).only_integer }
  end

  context "Appointment's association" do
    it{ should belong_to(:client) }
  end
  
end
