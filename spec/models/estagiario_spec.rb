# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Estagiario do
  after(:all) do
    Estagiario.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :estagiario
  end

  context 'validations' do
    context 'cep' do
      it { should have_valid(:cep).when('28.015-200') }
      it { should_not have_valid(:cep).when('222222222222222') }
    end
    context 'nome' do
      it { should have_valid(:nome).when('foo') }
      it { should_not have_valid(:nome).when(nil, '') }
    end
    context 'cpf' do
      it { should have_valid(:cpf).when('131.572.887-76', '13157288776') }
      it { should_not have_valid(:cpf).when('000.000.000-00', '00000000000') }
      it 'a unicidade do cpf' do
        FactoryGirl.create :estagiario, :cpf => '13157288776'
        (FactoryGirl.build :estagiario, :cpf => '13157288776').save.should be_false
      end
    end
    context 'email' do
      it { should have_valid(:email).when('foo@email.com') }
      it { should_not have_valid(:email).when('foo') }
    end
  end
end