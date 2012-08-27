# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Area do

  after(:all) do
    Area.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :area
  end

  should_have_many :children, :dependent => :destroy
  should_belong_to :father
  should_validate_presence_of :nome

  it "deve retornar um hash das áreas" do
    a = FactoryGirl.create :area, :nome => 'a'
    b = FactoryGirl.create :area, :nome => 'b'
    c = FactoryGirl.create :area, :nome => 'c', :father_id => a.id
    d = FactoryGirl.create :area, :nome => 'd', :father_id => a.id
    e = FactoryGirl.create :area, :nome => 'e', :father_id => c.id

    Area.arvore.should == { a => { c => { e => {} }, d => {} }, b => {} }
  end
end

