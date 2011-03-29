# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Estagiario do
  after(:all) do
    Estagiario.delete_all
  end

  it "should create a new instance given valid attributes" do
    Factory.create :estagiario
  end

  should_validate_presence_of :nome

  should_allow_values_for :email, "email@foo.com", "email.foo@test.com.br"
  should_allow_values_for :cpf, "97614535375", "976.145.353-75"

  should_not_allow_values_for :email, "email.foo.com", "email@foo"
  should_not_allow_values_for :cpf, "000.000.000-00", "00000000000"
end

