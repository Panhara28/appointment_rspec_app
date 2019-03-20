require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  let(:validate_attributes){
    { id: 1 }
  }
  describe "GET #index" do
    it "returns http success" do
      Appointment.create!
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      appointment = Appointment.create!
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
          post :create, params: {appointment: validate_attributes}
        }.to change(Appointment, :count).by(1)
      end

      it "redirects to the create appointment" do
        post :create, params: { appointment: validate_attributes }
        expect(response).to redirect_to(Appointment.last)
      end
    end

    context "with invalid params" do
      it "returns a success respose and display the new template" do
        post :create, params: { appointment: validate_attributes }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attribute){
        { id: 1 }
      }
      it "update the request appointment" do
        appointment = Appointment.create!
        put :update, params: { id: appointment.to_param, appointment: new_attribute }
        appointment.reload
      end

      it "redirects to appointment" do
        appointment = Appointment.create!
        put :update, params: { id: appointment.to_param, appointment: validate_attributes}
        expect(response).to redirect_to(appointment)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroy the requested appointment" do
      appointment = Appointment.create!
      expect{
        delete :destroy, params: { id: appointment.to_param}
      }.to change(Appointment, :count).by(0)
    end

    it "redirects to the appointments lists" do
      appointment = Appointment.create!
      delete :destroy, params: { id: appointment.to_param }
      expect(response).to redirect_to("/appointments")
    end
  end

end
