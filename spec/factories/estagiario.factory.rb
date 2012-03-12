# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :estagiario do |f|
  f.matricula_grh "MyString"
  f.nome "MyString"
  f.data_de_nascimento "2011-03-25"
  f.rg "MyString"
  f.orgao_expedidor "MyString"
  f.data_de_expedicao "2011-03-25"
  f.nacionalidade "MyString"
  f.naturalidade "MyString"
  f.sexo "MyString"
  f.filiacao "MyString"
  f.estado_civil "MyString"
  f.nome_do_conjuge "MyString"
  f.certificado_de_reservista "MyString"
  f.titulo_de_eleitor "MyString"
  f.cep "28.015-200"
  f.estado "MyString"
  f.cidade "MyString"
  f.bairro "MyString"
  f.rua "MyString"
  f.numero "MyString"
  f.complemento "MyString"
  f.telefone "MyString"
  f.celular "MyString"
  f.email "email@email.com"
end

