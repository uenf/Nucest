# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Supervisor do

  after(:all) do
    Supervisor.delete_all
  end

  it "should create a new instance given valid attributes" do
    @valid_attributes = {
      :nome => "Algum nome",
      :matricula => "123456-2010"
      :lotacao => "Lotação do supervisor"
      :funcao => "Função do supervisor"
      :telefone => "2227351001",
      :celular => "2298666666",
      :email => "algum@email.com",
    }

    Representante.create!(@valid_attributes)
  end

  describe "deve validar" do

    it "a presença do nome" do
      supervisor = Factory.build :supervisor, :nome => ""
      supervisor.save.should be_false
      supervisor = Factory.build :supervisor, :nome => "Fulano de Tal"
      supervisor.save.should be_true
    end

    it "o formato do E-mail" do
      supervisor = Factory.build :supervisor, :email => "email.com"
      supervisor.save.should be_false
      supervisor = Factory.build :supervisor, :email => "algum@email.com"
      supervisor.save.should be_true
    end

  end

end

