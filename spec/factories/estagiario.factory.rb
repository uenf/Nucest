# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estagiario do
    matricula_grh "MyString"
    nome "MyString"
    data_de_nascimento "2011-03-25"
    rg "MyString"
    orgao_expedidor "MyString"
    data_de_expedicao "2011-03-25"
    nacionalidade "MyString"
    naturalidade "MyString"
    sexo "MyString"
    filiacao "MyString"
    estado_civil "MyString"
    nome_do_conjuge "MyString"
    certificado_de_reservista "MyString"
    titulo_de_eleitor "MyString"
    cep "28.015-200"
    estado "MyString"
    cidade "MyString"
    bairro "MyString"
    rua "MyString"
    numero "MyString"
    complemento "MyString"
    telefone "MyString"
    celular "MyString"
    email "email@email.com"
  end
end

