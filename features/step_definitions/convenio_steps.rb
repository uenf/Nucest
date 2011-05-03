# -*- encoding : utf-8 -*-

Dado /^que eu tenho um convênio$/ do
  @convenio = Factory.create :convenio, :instituicao_id => @instituicao.id
end

Então /^eu devo ter (\d+) convênios$/ do |quantidade|
  Convenio.all.should have(quantidade.to_i).convenio
end

Então /^o convenio deve estar ligado à instituição$/ do
  @convenio ||= Convenio.all.first
  @convenio.instituicao_id.should == @instituicao.id
end

