require 'spec_helper'

describe Area do

  after(:all) do
    Area.delete_all
  end

  it "should create a new instance given valid attributes" do
    Factory.create :area
  end

  should_have_many :children, :dependent => :destroy
  should_belong_to :father
  should_validate_presence_of :nome
end

