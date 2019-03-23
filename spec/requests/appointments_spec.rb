require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  let(:validate_attributes){
    { id: 1, appointment_date: Time.now, duration: 10, price: 200 }
  }

  describe "GET /appointments" do
    it "should requests to /appointments with appointments#index" do
      get "/appointments"
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /appointments/1" do
    it "should requests to /appointments/1 with appointments#show" do
      get "/appointments/1", params: { id: 1}
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /appointments/new" do
    it "should requests to /appointments/new" do
      get "/appointments/new"
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /appointments" do
    it "should requests to /appointments" do
      post "/appointments", params: { appointment: :validate_attributes }
      expect(response).to redirect_to(assigns(:appointment))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(flash[:notice]).to include("Appointment was successfully created")
    end
  end

  describe "GET /appointments" do
    it "should requests to /appointments/1/edit" do
      get "/appointments/:id/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH /appointments/1" do
    before { Appointment.create! validate_attributes }
    it "should requests to /appointments/1" do
      patch "/appointments/1", params: {  :appointment => { id: 1 } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(assigns(:appointment))
    end
  end

  describe "DELETE /appointments/1" do
    before { Appointment.create! validate_attributes }
    it "should requests to /appointments/1" do
      delete "/appointments/1", params: { :appointment => { id: 1 } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/appointments")
    end
  end
end
