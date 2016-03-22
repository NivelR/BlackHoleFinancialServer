require 'rails_helper'

RSpec.describe Tag, :type => :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:tag)).to be_valid
    end

    it { should validate_presence_of(:tag_name) }
    it { should have_many(:transactions)}
  end
end
