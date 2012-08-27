# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :instituicao do
    sequence(:nome) { |n| "Algum Nome #{n}" }
    origem Instituicao::ORIGEM["Nacional"]
    sigla "ALNO"
    tipo "Empresa"
    sequence(:razao_social) { |n| "empresa#{n}" }
    cep "28.015-200"
    estado "Rio de Janeiro"
    cidade "Campos dos Goytacazes"
    bairro "Centro"
    numero "123"
    complemento "APTO 102"
    telefone "2227351001"
    celular "2298666666"
    fax "2227351001"
    caixa_postal "970"
    email "algum@email.com"
    site "http://www.sitedainstituicao.com.br"
    pais "Brasil"
    registro_local "abcd-123"
  end
end

