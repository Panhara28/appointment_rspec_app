require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  include_context "client setup"

  let(:valid_attributes){
    { client_id: client.id, appointment_date: Time.now,duration: 1, price: 200 }
  }
  let(:appointment) { FactoryBot.create(:appointment) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: appointment.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "create a new Appointment" do
        expect{
          post :create,
          params: { appointment: valid_attributes }
        }.to change(Appointment, :count).by(1)
      end

      it "redirects to the create appointment" do
        post :create, params: { appointment: valid_attributes }
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid params" do
      it "returns a success respose and display the new template" do
        post :create,
        params: { appointment: valid_attributes }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attribute){
        { id: 1, appointment_date: Time.now, duration: 1, price: 200, client_id: client.id }
      }
      it "update the request appointment" do
        appointment = Appointment.create! new_attribute
        put :update, params: { id: appointment.to_param, appointment: new_attribute }
        appointment.reload
      end

      it "redirects to appointment" do
        appointment = Appointment.create! new_attribute
        put :update, params: { id: appointment.to_param, appointment: appointment}
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroy the requested appointment" do
      expect{
        delete :destroy, params: { id: appointment.to_param}
      }.to change(Appointment, :count).by(1)
    end

    it "redirects to the appointments lists" do
      delete :destroy, params: { id: appointment.to_param }
      expect(response).to redirect_to("/appointments")
    end
  end

end
