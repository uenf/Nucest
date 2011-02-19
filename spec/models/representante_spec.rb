# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Representante do

  after(:all) do
    Representante.delete_all
  end

  it "should create a new instance given valid attributes" do
    Factory.create :representante
  end

  should_belong_to :instituicao

  should_validate_presence_of :nome

  should_allow_values_for :email, "email@foo.com", "email.foo@test.com.br"
  should_allow_values_for :cpf, "97614535375", "976.145.353-75"

  should_not_allow_values_for :email, "email.foo.com", "email@foo"
  should_not_allow_values_for :cpf, "123.456.789-10", "01234567890"

end

