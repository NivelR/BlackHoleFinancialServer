require "rails_helper"

RSpec.describe Users::SessionsController, type: :controller do
  describe "POST #create" do

   before(:each) do
    @user = FactoryGirl.create :user
    request.env['devise.mapping'] = Devise.mappings[:user]
   end

    context "when the credentials are correct" do

      before(:each) do
        credentials = { email: @user.email, password: "12345678" }
        post :create, params: { user: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:authentication_token]).to eql @user.authentication_token
      end

      it { should respond_with 200 }
    end

    context "when the credentials are incorrect" do

      before(:each) do
        credentials = { email: @user.email, password: "invalidpassword" }
        post :create, params: { user: credentials }
      end

      it "returns a json with an error" do
        expect(json_response[:errors]).to eql "Invalid login credentials"
      end

      it { should respond_with 401 }
    end
  end

  describe "DELETE #destroy" do

    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryGirl.create :user
      sign_in @user
      delete :destroy, params: { id: @user.authentication_token }
    end

    it { should respond_with 204 }

  end
end
