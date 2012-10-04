# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Usuario do

  after(:all) do
    Usuario.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :usuario
  end

  context 'validations' do
    context 'password_confirmation' do
      it { should have_valid(:password_confirmation).when('foobar') }
      it { should_not have_valid(:password_confirmation).when(nil, '') }
    end
    context 'password' do
      it { should have_valid(:password).when('foobar') }
      it { should_not have_valid(:password).when(nil, '', '123') }
    end
    context 'email' do
      it { should have_valid(:email).when('foo@email.com') }
      it { should_not have_valid(:email).when('foo', nil, '') }
    end
  end
end