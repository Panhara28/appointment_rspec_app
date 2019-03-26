require 'rails_helper'

RSpec.describe "Locations", type: :request do
  let(:validate_attributes){
    {
      id: 1,
      nickname: "Tik Laork",
      city: "PP",
      street_address: "123",
      state: "PP", zipcode: "123",
      business_name: "freelance"
    }
  }

  describe "GET /locations" do
    it "should requests to /locations with locations#index" do
      get "/locations"
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /locations/1" do
    it "should requests to /locations/1 with locations#show" do
      get "/locations/1"
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /locations/new" do
    it "should requests to /locations/new with locations#new" do
      get "/locations/new"
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /locations" do
    it "should requests to /locations with locations#create" do
      post "/locations", params: { location: validate_attributes }
      expect(response).to redirect_to(assigns(:location))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(flash[:notice]).to include("Location was successfully created")
    end
  end

  describe "GET /locations/1/edit" do
    it "should requests to /locations/1/edit with locations#edit" do
      get "/locations/1/edit"
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /locations/1" do
    before { Location.create! validate_attributes }
    it "should requests to /locations/1 with locations#update" do
      patch "/locations/1", params: { :location => { id: 1 } }
      expect(response).to redirect_to(assigns(:location))
      expect(flash[:notice]).to include("Location was successfully updated")
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /locations/1" do
    before{ Location.create! validate_attributes }
    it "should requests to /locations/1 with locations#destroy" do
      delete "/locations/1", params: { :location => { id: 1 } }
      expect(response).to redirect_to("/locations")
      expect(flash[:notice]).to include("Location was successfully deleted")
      expect(response).to have_http_status(302)
    end
  end
end
