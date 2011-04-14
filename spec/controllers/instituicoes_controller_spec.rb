# -*- encoding : utf-8 -*-
require 'spec_helper'

describe InstituicoesController do

#  it 'não deve gerar relatório se não existir tipo de convênio'
#    instituicao = mock_instituicao(:tipo_de_convenio => "",
#                                   :id => "7")
#    Instituicao.stub(:find).with("7") { instituicao }
#
#  end

### ERRO: VER PORQUE ESTÁ FALHANDO! ###
#  context 'ao buscar cep' do

#    it 'deve retornar um json com os campos do endereço e erro:false para cep correto' do
#      params = {:cep => '22.640-100', :controller=>"instituicoes", :action=>"buscar_cep"}
#      BuscaEndereco.should_receive(:por_cep).with(params[:cep]) {['Avenida', 'das Americas', 'Barra da Tijuca', 'RJ', 'Rio de Janeiro', 22640100]}
#      get :buscar_cep, params
#      response.body.should == '{"erro":false,"rua":"Avenida das Americas","bairro":"Barra da Tijuca","cidade":"Rio de Janeiro","estado":"Rio de Janeiro","cep":22640100}'
#    end

#    it 'deve retornar um json com os campos do endereço como null e erro:true para cep incorreto' do
#      params = {:cep => '00.000-000', :controller=>"instituicoes", :action=>"buscar_cep"}
#      BuscaEndereco.should_receive(:por_cep).with(params[:cep]) {'O CEP informado possui um formato inválido.'}
#      get :buscar_cep, params
#      response.body.should == '{"erro":true,"rua":null,"bairro":null,"cidade":null,"estado":null,"cep":null}'
#    end

#  end
end

