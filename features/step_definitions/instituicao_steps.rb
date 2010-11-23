# -*- encoding : utf-8 -*-

Então /^eu devo ter (\d+) instituições$/ do |quantidade|
  Instituicao.all.should have(quantidade.to_i).instituicao
end

