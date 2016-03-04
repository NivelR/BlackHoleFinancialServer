require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        request.env['devise.mapping'] = Devise.mappings[:user]
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, params: { user: @user_attributes }
      end

      it "renders the json representation for the user record just created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response.dig(:data, :email)).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        request.env['devise.mapping'] = Devise.mappings[:user]
        @invalid_user_attributes = { password: "12345678",
                                     password_confirmation: "12345678" }
        post :create, params: { user: @invalid_user_attributes }, format: :json
      end

      it "renders an errors json" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response.dig(:errors, :email)).to include "can't be blank"
      end

      it { should respond_with 422 }
    end

  end

  describe "PUT #update" do

    context "when is successfully updated" do
      before(:each) do
        request.env['devise.mapping'] = Devise.mappings[:user]
        @user = FactoryGirl.create :user
        # request.headers['Accept'] = 'application/json'
        # request.headers['Content-Type'] = 'application/json'
        # request.headers['X-User-Email'] = @user.email
        # request.headers['X-User-Token'] = @user.authentication_token
        patch :update, params: { id: @user.id,
                         user: { email: "newmail@example.com" } }, format: :json
      end

      it "renders the json representation for the updated user" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response.dig(:data, :email)).to eql "newmail@example.com"
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        request.env['devise.mapping'] = Devise.mappings[:user]
        @user = FactoryGirl.create :user
        patch :update, params: { id: @user.id,
                         user: { email: "bademail.com" } }, format: :json
      end

      it "renders an errors json" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response.dig(:errors, :email)).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      delete :destroy, params: { id: @user.id }, format: :json
    end

    it { should respond_with 204 }
  end

end
