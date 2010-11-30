# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Instituicao do

  after(:all) do
    Instituicao.delete_all
  end

  describe "deve validar" do

    it "a presença do nome" do
      instituicao = Factory.build :instituicao, :nome => ""
      instituicao.save.should be_false
    end

    it "a presença do CNPJ" do
      instituicao = Factory.build :instituicao, :cnpj => ""
      instituicao.save.should be_false
    end

    it "o formato do E-mail" do
      instituicao = Factory.build :instituicao, :email => "email.com"
      instituicao.save.should be_false
      instituicao = Factory.build :instituicao, :email => "algum@email.com"
      instituicao.save.should be_true
    end

    it "o formato do site" do
      instituicao = Factory.build :instituicao, :site => "site errado"
      instituicao.save.should be_false
      instituicao = Factory.build :instituicao, :site => "http://www.sitecerto.com"
      instituicao.save.should be_true
    end
  end

end

