# -*- encoding : utf-8 -*-

Factory.define :instituicao do |p|
  p.nome "Algum nome"
  p.cnpj "00.000.000/0000-00"
  p.sigla "ALNO"
  p.tipo "Empresa"
  p.razao_social "Algum nome SA"
  p.tipo_de_convenio "UENF concedente"
  p.cep "2800-200"
  p.estado "Rio de Janeiro"
  p.cidade "Campos dos Goytacazes"
  p.bairro "Centro"
  p.numero "123"
  p.complemento "APTO 102"
  p.telefone "(22) 2222-2222"
  p.celular "(22) 9999-9999"
  p.fax "(22) 1111-1111"
  p.caixa_postal "970"
  p.email "algum@email.com"
  p.site "http://www.sitedainstituicao.com.br"
  p.inicio_do_convenio "13/12/2010"
  p.fim_do_convenio "13/12/2011"
end

