require 'rails_helper'

RSpec.describe Client, type: :model do
  context "Client's attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:address).of_type(:string) }
    it { should have_db_column(:phone).of_type(:string) }
  end

  context "Client's validations" do
    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:address) }
    it{ should validate_presence_of(:phone) }

    it{ should validate_length_of(:name).is_at_most(20)}
    it{ should validate_numericality_of(:phone).only_integer }

  end
end
