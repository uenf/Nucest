# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Representante do

  after(:all) do
    Representante.delete_all
  end

  describe "deve validar" do

    it "a presença do nome" do
      representante = Factory.build :representante, :nome => ""
      representante.save.should be_false
    end

    it "o formato do E-mail" do
      representante = Factory.build :representante, :email => "email.com"
      representante.save.should be_false
      representante = Factory.build :representante, :email => "algum@email.com"
      representante.save.should be_true
    end

    it "o formato do CPF" do
      representante = Factory.build :representante, :cpf => "000.000.000-00"
      representante.save.should be_false
      representante = Factory.build :representante, :cpf => "131.572.887"
      representante.save.should be_false
      representante = Factory.build :representante, :cpf => "13157288776"
      representante.save.should be_true
      representante = Factory.build :representante, :cpf => "131.572.887-76"
      representante.save.should be_true
    end

  end

end

