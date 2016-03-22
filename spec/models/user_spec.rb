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
    it { should have_many(:transactions)}
  end

  describe "when email address is already taken" do
    it "should not be valid" do
      FactoryGirl.create(:user, email: 'example@gmail.org')
      user_with_same_email = FactoryGirl.build(:user, email: 'example@gmail.org'.upcase)
      user_with_same_email.valid?
      expect(user_with_same_email.errors[:email]).to include("has already been taken")
    end
  end

  describe "#transactions association" do
    before do
      @user = FactoryGirl.create(:user)
      3.times { FactoryGirl.create :transaction, user: @user }
    end

    it "destroys the associated transactions on self destruct" do
      transactions = @user.transactions
      @user.destroy
      transactions.each do |transaction|
        expect(Transaction.find(transaction)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
