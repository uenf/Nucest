# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :representante do
  	nome "Nome do Representante"
  	funcao "Função do representante"
  	rg "00.000.000-00"
  	orgao_expedidor "Detran"
  	cpf "131.572.887-76"
  	telefone "2227351001"
  	celular "2298888888"
  	email "email@representante.com"
  end
end

