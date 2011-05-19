# -*- encoding: utf-8 -*-

Então /^eu devo ter (\d+) item de tramitação$/ do |quantidade|
  ItemTramitacao.all.length.should == quantidade.to_i
end

