# -*- encoding : utf-8 -*-

Dado /^que eu tenho um estagiário$/ do
  @estagiario = Factory.create :estagiario
end

Então /^eu devo ter (\d+) estagiários?$/ do |quantidade|
  Estagiario.all.should have(quantidade.to_i).estagiario
end

