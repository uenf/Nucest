# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Convenio do
  should_validate_presence_of :tipo

  should_belong_to :instituicao

  describe "deve validar" do
      it "o formato do início do convênio" do
      convenio = Factory.build :convenio, :inicio_br => "12/30/2012"
      convenio.save.should be_false
      convenio = Factory.build :convenio, :inicio_br => "30/12/2012"
      convenio.save.should be_true
    end

    it "o formato do fim do convênio" do
      convenio = Factory.build :convenio, :fim_br => "12/30/2012"
      convenio.save.should be_false
      convenio = Factory.build :convenio, :fim_br => "12/12/2012"
      convenio.save.should be_true
    end
  end
end

