# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Representante do

  after(:all) do
    Representante.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :representante
  end

  context 'relationships' do
    it { should belong_to :instituicao }
  end

  context 'validations' do
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

  it "deve validar a unicidade do CPF por instituição" do
    instituicao = FactoryGirl.create :instituicao
    FactoryGirl.create :representante, :cpf => '13157288776', :instituicao => instituicao
    instituicao.reload
    (FactoryGirl.build :representante, :cpf => '13157288776', :instituicao => instituicao).save.should be_false
    (FactoryGirl.build :representante, :cpf => '95797424720', :instituicao => instituicao).save.should be_true
    (FactoryGirl.build :representante, :cpf => '13157288776', :instituicao => (FactoryGirl.create :instituicao)).save.should be_true
  end
end

