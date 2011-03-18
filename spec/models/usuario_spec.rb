require 'spec_helper'

describe Usuario do

  after(:all) do
    Usuario.delete_all
  end

  it "should create a new instance given valid attributes" do
    Factory.create :usuario
  end

  should_validate_presence_of :password, :email, :password_confirmation

end

