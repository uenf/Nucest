# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Representante do

  after(:all) do
    Representante.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :representante
  end

  should_belong_to :instituicao

  should_validate_presence_of :nome

  should_allow_values_for :email, "email@foo.com", "email.foo@test.com.br"
  should_allow_values_for :cpf, "97614535375", "976.145.353-75"

  should_not_allow_values_for :email, "email.foo.com", "email@foo"
  should_not_allow_values_for :cpf, "000.000.000-00", "00000000000"

  it "deve validar a unicidade do CPF por instituição" do
    instituicao = FactoryGirl.create :instituicao
    FactoryGirl.create :representante, :cpf => '13157288776', :instituicao => instituicao
    instituicao.reload
    (Factory.build :representante, :cpf => '13157288776', :instituicao => instituicao).save.should be_false
    (Factory.build :representante, :cpf => '95797424720', :instituicao => instituicao).save.should be_true
    (Factory.build :representante, :cpf => '13157288776', :instituicao => (FactoryGirl.create :instituicao)).save.should be_true
  end
end

