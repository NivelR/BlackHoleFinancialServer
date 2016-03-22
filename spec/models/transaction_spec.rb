require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:transaction)).to be_valid
    end

    it { should validate_presence_of(:tag_id) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:amount_type) }
    it { should validate_presence_of(:user_id) }
    it { should belong_to(:user)}
    it { should belong_to(:tag)}
  end
end
