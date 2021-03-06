# -*- encoding : utf-8 -*-

Dado /^que eu tenho um representante$/ do
  @representante = FactoryGirl.create :representante, :instituicao_id => @instituicao.id
end

Dado /^que eu tenho um representante com CPF "([^"]*)"$/ do |cpf|
  @representante = FactoryGirl.create :representante, :instituicao_id => @instituicao.id, :cpf => cpf
end

Então /^eu devo ter (\d+) representantes$/ do |quantidade|
  Representante.all.should have(quantidade.to_i).representante
end

Então /^o representante deve estar ligado à instituição$/ do
  @representante ||= Representante.all.first
  @representante.instituicao_id.should == @instituicao.id
end

