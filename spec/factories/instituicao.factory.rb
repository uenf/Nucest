# -*- encoding : utf-8 -*-

Factory.define :instituicao do |p|
  p.sequence(:nome) { |n| "Algum Nome #{n}" }
  p.origem Instituicao::ORIGEM["Nacional"]
  p.sigla "ALNO"
  p.tipo "Empresa"
  p.sequence(:razao_social) { |n| "empresa#{n}" }
  p.cep "28.015-200"
  p.estado "Rio de Janeiro"
  p.cidade "Campos dos Goytacazes"
  p.bairro "Centro"
  p.numero "123"
  p.complemento "APTO 102"
  p.telefone "2227351001"
  p.celular "2298666666"
  p.fax "2227351001"
  p.caixa_postal "970"
  p.email "algum@email.com"
  p.site "http://www.sitedainstituicao.com.br"
  p.pais "Brasil"
  p.registro_local "abcd-123"
end

