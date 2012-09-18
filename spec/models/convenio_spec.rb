# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Convenio do
  should_validate_presence_of :tipo
  should_belong_to :instituicao

  after(:each) { back_to_the_present }

  describe 'deve validar' do
      it 'o formato do início do convênio' do
      convenio = FactoryGirl.build :convenio, :inicio_br => '12/30/2012', :fim_br => '12/08/2013'
      convenio.save.should be_false
      convenio = FactoryGirl.build :convenio, :inicio_br => '30/12/2012', :fim_br => '12/08/2013'
      convenio.save.should be_true
    end

    it 'o formato do fim do convênio' do
      convenio = FactoryGirl.build :convenio, :fim_br => '12/30/2012', :inicio_br => '12/08/2011'
      convenio.save.should be_false
      convenio = FactoryGirl.build :convenio, :fim_br => '12/12/2012', :inicio_br => '12/08/2011'
      convenio.save.should be_true
    end
  end

  it 'deve atualizar a situação' do
    convenio = FactoryGirl.create :convenio
    convenio.situacao.should == Convenio::SITUACAO['Em tramitação']

    convenio.inicio = Date.today - 1
    convenio.fim = Date.today + 4
    convenio.save
    convenio.reload.situacao.should == Convenio::SITUACAO['Em vigência']

    convenio.inicio = Date.today - 10
    convenio.fim = Date.today - 5
    convenio.save
    convenio.reload.situacao.should == Convenio::SITUACAO['Findado']
  end

  it 'deve findar o convênio' do
    convenio = FactoryGirl.create :convenio, :inicio => Date.today, :fim => Date.today + 60.days, :situacao => Convenio::SITUACAO['Em vigência']
    Delorean.time_travel_to '100 days from now'
    Convenio.findar_convenios
    convenio.reload.situacao.should == Convenio::SITUACAO['Findado']
  end

end

