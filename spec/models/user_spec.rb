require 'rails_helper'


RSpec.describe User, type: :model do

  	it "has a valid factory" do
  		@user = FactoryGirl.create(:user)
    	expect(@user).to be_valid
  	end
  	it "is invalid without a firstname" do
  		@user = FactoryGirl.build(:user, first_name: " ")
    	expect(@user).to_not be_valid
  	end
  	it "is invalid without a lastname" do 
  		@user = FactoryGirl.build(:user, last_name: " ")
  		expect(@user).to_not be_valid
  	end
end
