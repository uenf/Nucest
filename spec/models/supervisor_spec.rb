# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Supervisor do

  after(:all) do
    Supervisor.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :supervisor
  end

  should_belong_to :instituicao

  should_validate_presence_of :nome

  should_allow_values_for :email, "email@foo.com", "email.foo@test.com.br"

  should_not_allow_values_for :email, "email.foo.com", "email@foo"

end

