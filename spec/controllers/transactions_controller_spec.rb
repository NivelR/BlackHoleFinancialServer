require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      @user = FactoryGirl.create :user
      4.times { FactoryGirl.create :transaction, user: @user }
      sign_in @user
      get :index
    end

    it "returns 4 records from database" do
      expect(json_response.length).to eq(4)
    end

    it { should respond_with 200 }
  end
end
