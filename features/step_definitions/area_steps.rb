# -*- encoding: utf-8 -*-

Dado /^que eu tenho uma área$/ do
  @area = FactoryGirl.create :area
end

Então /^eu devo ter (\d+) áreas?$/ do |quantidade|
  Area.all.should have(quantidade.to_i).area
end

Então /^a área deve estar ligado à instituição$/ do
  @area ||= area.all.first
  @area.instituicao_id.should == @instituicao.id
end

Então /^a sub\-área deve estar ligada à área$/ do
  Area.last.father_id.should == @area.id
end

