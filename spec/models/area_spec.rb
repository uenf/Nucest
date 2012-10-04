# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Area do

  after(:all) do
    Area.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :area
  end


  context 'relationships' do
    it { should belong_to :father }
    it { should have_many :children }
  end

  context 'validations' do
    context 'nome' do
      it { should have_valid(:nome).when('foo') }
      it { should_not have_valid(:nome).when('', nil) }
    end
  end

  it "deve retornar um hash das áreas" do
    a = FactoryGirl.create :area, :nome => 'a'
    b = FactoryGirl.create :area, :nome => 'b'
    c = FactoryGirl.create :area, :nome => 'c', :father_id => a.id
    d = FactoryGirl.create :area, :nome => 'd', :father_id => a.id
    e = FactoryGirl.create :area, :nome => 'e', :father_id => c.id

    Area.arvore.should == { a => { c => { e => {} }, d => {} }, b => {} }
  end
end

