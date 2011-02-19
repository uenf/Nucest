# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Instituicao do

  after(:all) do
    Instituicao.delete_all
  end

  it "should create a new instance given valid attributes" do
    Factory.create :instituicao
  end

  should_validate_presence_of :nome

  should_have_many :representantes, :supervisores

  should_validate_numericality_of :caixa_postal, :greater_than_or_equal_to => 0, :only_integer => true, :allow_blank => true

  should_allow_values_for :email, "email@foo.com", "email.foo@test.com.br"
  should_allow_values_for :cnpj, "69.103.604/0001-60", "69103604000160"
  should_allow_values_for :site, "google.com", "http://google.com", "http://www.google.com", "http://google.com.br", "http://www.uenf.br"

  should_not_allow_values_for :email, "email.foo.com", "email@foo"
  should_not_allow_values_for :cnpj, "00.103.604/0001-60", "00103604000160", "00.103.604"
  should_not_allow_values_for :site, "google", "dazero@praele.com"

  context "validating uniqueness" do
    before(:each) do
      Factory.create :instituicao
    end

    should_validate_uniqueness_of :nome, :cnpj, :razao_social, :allow_blank => true
  end

end

