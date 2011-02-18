# -*- encoding : utf-8 -*-

Então /^eu devo ter (\d+) supervisores$/ do |quantidade|
  Supervisor.all.should have(quantidade.to_i).supervisor
end

Então /^o supervisor deve estar ligado à instituição$/ do
  @supervisor ||= Supervisor.all.first
  @supervisor.instituicao_id.should == @instituicao.id
end

