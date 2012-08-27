# -*- encoding : utf-8 -*-

Dado /^que eu tenho um estagiário$/ do
  @estagiario = FactoryGirl.create :estagiario
end

Dado /^que eu tenho um estagiário com nome "([^"]*)"$/ do |nome|
  @estagiario_com_nome = FactoryGirl.create :estagiario, :nome => nome
end

Dado /^que eu tenho um estagiário com CPF "([^"]*)"$/ do |cpf|
  @estagiario_com_nome = FactoryGirl.create :estagiario, :cpf => cpf
end

Então /^eu devo ter (\d+) estagiários?$/ do |quantidade|
  Estagiario.all.should have(quantidade.to_i).estagiario
end

