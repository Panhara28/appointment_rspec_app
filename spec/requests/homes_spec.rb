require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
    it "should requests to /homes and as the root path" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end
end
