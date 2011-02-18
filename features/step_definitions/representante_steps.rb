# -*- encoding : utf-8 -*-

Então /^eu devo ter (\d+) representantes$/ do |quantidade|
  Representante.all.should have(quantidade.to_i).representante
end

Então /^o representante deve estar ligado à instituição$/ do
  @representante ||= Representante.all.first
  @representante.instituicao_id.should == @instituicao.id
end

