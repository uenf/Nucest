require 'spec_helper'

describe ItemTramitacao do
  should_belong_to :convenio

  should_validate_presence_of :origem_do_contato, :data_br, :forma_de_contato, :descricao

  describe "deve validar" do
      it "o formato da data" do
      item_tramitacao = FactoryGirl.build :item_tramitacao, :data_br => "12/30/2012"
      item_tramitacao.save.should be_false
      item_tramitacao = FactoryGirl.build :item_tramitacao, :data_br => "30/12/2012"
      item_tramitacao.save.should be_true
    end
  end

end

