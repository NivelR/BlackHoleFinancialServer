require "rails_helper"

RSpec.describe ReportsController, type: :controller do
  describe "GET #daily_report" do
    before(:each) do
      @user = FactoryGirl.create :user
      4.times { FactoryGirl.create :transaction, user: @user }
      4.times { FactoryGirl.create :income, user: @user }
      sign_in @user
      get :daily_report
    end

    it "returns a daily report with expenses and incomes" do
      expect(json_response.length).to eq(1)
      expect(json_response.dig(:report, :expenses)).not_to eq 0
      expect(json_response.dig(:report, :incomes)).not_to eq 0
    end

    it { should respond_with 200 }
  end
end
