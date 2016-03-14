require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should respond_to(:authentication_token) }
  end

  describe "when email address is already taken" do
    it "should not be valid" do
      FactoryGirl.create(:user, email: 'example@gmail.org')
      user_with_same_email = FactoryGirl.build(:user, email: 'example@gmail.org'.upcase)
      user_with_same_email.valid?
      expect(user_with_same_email.errors[:email]).to include("has already been taken")
    end
  end
end
