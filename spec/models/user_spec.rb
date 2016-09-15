require 'rails_helper'


RSpec.describe User, type: :model do

  	it "has a valid factory" do
  		user = FactoryGirl.create(:user)
    	expect(user).to be_valid
  	end

  	it "is invalid without a firstname" do
  		user = FactoryGirl.build(:user, first_name: " ")
    	expect(user).to_not be_valid
  	end

  	it "is invalid without a lastname" do 
  		user = FactoryGirl.build(:user, last_name: " ")
  		expect(user).to_not be_valid
  	end

  	it "has unique email address" do
  		user = FactoryGirl.create(:user)
  		duplicate_user = user.dup
  		duplicate_user.email = user.email.upcase
  		user.save
  		expect(duplicate_user).to_not be_valid
  	end

  	it "should have a present password (nonblank)" do
  		user = FactoryGirl.build(:user)
  		user.password = user.password_confirmation = " " * 6
  		expect(user).to_not be_valid
  	end

  	it "should have a minimum length for password" do
  		user = FactoryGirl.build(:user)
  		user.password = user.password_confirmation = "a" * 5
  		expect(user).to_not be_valid
  	end

end
