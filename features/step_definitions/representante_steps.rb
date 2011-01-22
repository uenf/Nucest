# -*- encoding : utf-8 -*-

Então /^eu devo ter (\d+) representantes$/ do |quantidade|
  Representante.all.should have(quantidade.to_i).representante
end

