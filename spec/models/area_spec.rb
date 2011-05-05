# -*- encoding : utf-8 -*-
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

  it "deve retornar um hash das áreas" do
    a = Factory.create :area, :nome => 'a'
    b = Factory.create :area, :nome => 'b'
    c = Factory.create :area, :nome => 'c', :father_id => a.id
    d = Factory.create :area, :nome => 'd', :father_id => a.id
    e = Factory.create :area, :nome => 'e', :father_id => c.id

    Area.arvore.should == { a => { c => { e => {} }, d => {} }, b => {} }
  end
end

