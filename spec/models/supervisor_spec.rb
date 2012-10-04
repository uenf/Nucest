# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Supervisor do

  after(:all) do
    Supervisor.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :supervisor
  end

  context 'relationships' do
    it { should belong_to :instituicao }
  end

  context 'validations' do
    context 'nome' do
      it { should have_valid(:nome).when('foo') }
      it { should_not have_valid(:nome).when(nil, '') }
    end
    context 'email' do
      it { should have_valid(:email).when('foo@email.com') }
      it { should_not have_valid(:email).when('foo') }
    end
  end
end

