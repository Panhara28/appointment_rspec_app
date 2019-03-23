require 'rails_helper'

RSpec.describe Location, type: :model do

  context "Location's attributes" do
    it{ should have_db_column(:nickname).of_type(:string) }
    it{ should have_db_column(:city).of_type(:string) }
    it{ should have_db_column(:street_address).of_type(:string) }
    it{ should have_db_column(:state).of_type(:string) }
    it{ should have_db_column(:zipcode).of_type(:string) }
    it{ should have_db_column(:business_name).of_type(:string) }
  end

  context "Location's validation" do
    it{ should validate_presence_of(:nickname) }
    it{ should validate_presence_of(:city) }
    it{ should validate_presence_of(:street_address) }
    it{ should validate_presence_of(:state) }
    it{ should validate_presence_of(:zipcode) }
    it{ should validate_presence_of(:business_name) }
  end

  context "Location's association" do
    
  end

end
