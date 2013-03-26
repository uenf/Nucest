# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Instituicao do

  after(:all) do
    Instituicao.delete_all
  end

  it "should create a new instance given valid attributes" do
    FactoryGirl.create :instituicao
  end

  context 'validations' do
    context 'nome' do
      it { should have_valid(:nome).when('foo') }
      it { should_not have_valid(:nome).when(nil, '') }
    end
    context 'cnpj' do
      it { should have_valid(:cnpj).when('69.103.604/0001-60', '69103604000160') }
      it { should_not have_valid(:cnpj).when('00.000.000/0000-00', '00000000000000') }
    end
    context 'email' do
      it { should have_valid(:email).when('foo@email.com') }
      it { should_not have_valid(:email).when('foo') }
    end
    context 'site' do
      it { should have_valid(:site).when('email.com') }
      it { should_not have_valid(:site).when('foo') }
    end

    context 'caixa_postal' do
      it { should have_valid(:caixa_postal).when('1', 1, '') }
      it { should_not have_valid(:caixa_postal).when('-1', -1) }
    end
  end

  context 'relationships' do
    it { should have_many :representantes }
    it { should have_many :supervisores }
  end

  describe "deve validar" do
    context "a unicidade" do
      before(:each) do
        FactoryGirl.create :instituicao, :cnpj => "69.103.604/0001-60",
          :nome => 'Foo', :razao_social => 'Bar'
      end

      it 'nome' do
        instituicao = FactoryGirl.build :instituicao, :nome => 'Foo'
        instituicao.valid?.should be_false
      end

      it 'cnpj' do
        instituicao = FactoryGirl.build :instituicao, :cnpj => '69.103.604/0001-60'
        instituicao.valid?.should be_false
      end

      it 'razao_social' do
        instituicao = FactoryGirl.build :instituicao, :razao_social => 'Bar'
        instituicao.valid?.should be_false
      end
    end
  end
end

