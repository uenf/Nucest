# -*- encoding : utf-8 -*-

Dado /^que eu tenho um estagiário$/ do
  @estagiario = Factory.create :estagiario
end

Dado /^que eu tenho um estagiário com nome "([^"]*)"$/ do |nome|
  @estagiario_com_nome = Factory.create :estagiario, :nome => nome
end

Dado /^que eu tenho um estagiário com CPF "([^"]*)"$/ do |cpf|
  @estagiario_com_nome = Factory.create :estagiario, :cpf => cpf
end

Então /^eu devo ter (\d+) estagiários?$/ do |quantidade|
  Estagiario.all.should have(quantidade.to_i).estagiario
end

