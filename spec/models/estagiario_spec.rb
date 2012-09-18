# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Estagiario do
  after(:all) do
    Estagiario.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :estagiario
  end

  should_validate_presence_of :nome

  should_allow_values_for :email, "email@foo.com", "email.foo@test.com.br"
  should_allow_values_for :cpf, "97614535375", "976.145.353-75"
  should_allow_values_for :cep, "28.015-200"

  should_not_allow_values_for :email, "email.foo.com", "email@foo"
  should_not_allow_values_for :cpf, "000.000.000-00", "00000000000"
  should_not_allow_values_for :cep, "123456789101112"


  it 'a unicidade do cpf' do
    FactoryGirl.create :estagiario, :cpf => '13157288776'
    (FactoryGirl.build :estagiario, :cpf => '13157288776').save.should be_false
  end
end

