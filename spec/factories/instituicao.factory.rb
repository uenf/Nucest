# -*- encoding : utf-8 -*-

Factory.define :instituicao do |p|
  p.nome "Algum nome"
  p.origem Instituicao::ORIGEM["Nacional"]
  p.cnpj "69.103.604/0001-60"
  p.sigla "ALNO"
  p.tipo "Empresa"
  p.razao_social "Algum nome SA"
  p.tipo_de_convenio "UENF concedente"
  p.cep "28015200"
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
  p.inicio_do_convenio "13/12/2010"
  p.fim_do_convenio "13/12/2011"
  p.pais "Brasil"
  p.registro_local "abcd-123"
end

