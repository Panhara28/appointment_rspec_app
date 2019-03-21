require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:validate_attributes){
    { id: 1, name: "dara", address: "pp", phone: "012848392" }
  }

  describe "GET #index" do
    it "return http success" do
      Client.create! validate_attributes
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      client = Client.create! validate_attributes
      get :show, params: { id: client }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "create a new Client" do
        expect{
          client = Client.create! validate_attributes
          post :create, params: { client: client }
        }.to change(Client, :count).by(1)
      end

      it "redirects to create Client" do
        client = Client.create! validate_attributes
        post :create, params: { client: client }
        expect(response).to have_http_status(204)
      end
    end

    context "with invalid params" do
      it "returns a success response and display the new template" do
        post :create, params: { appointment: validate_attributes }
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attribute){
        {id: 1, name: "dara123", address: "KP", phone: "01232123"}
      }
      it "update the request client" do
        client = Client.create! new_attribute
        put :update, params: { id: client.to_param, client: client }
        client.reload
      end

      it "redirects to client" do
        client = Client.create! new_attribute
        put :update, params: { id: client.to_param, client: client }
        expect(response).to have_http_status(204)
      end
    end
  end
end
