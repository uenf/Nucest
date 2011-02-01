# -*- encoding : utf-8 -*-

Então /^eu devo ter (\d+) instituições$/ do |quantidade|
  Instituicao.all.should have(quantidade.to_i).instituicao
end

Dado /^que eu tenho uma instituição$/ do
  @instituicao = Factory.create :instituicao, :nome => "UENF1",
                                              :cnpj => "69.103.604/0001-60"
end

Dado /^que eu tenho uma instituição com nome "([^"]*)"$/ do |nome|
  @instituicao_com_nome = Factory.create :instituicao, :nome => nome,
                                                       :cnpj => "69.103.604/0001-60"
end

Dado /^que eu tenho uma instituição com CNPJ "([^"]*)"$/ do |cnpj|
  @instituicao_com_nome = Factory.create :instituicao, :nome => "UENF2",
                                                       :cnpj => cnpj
end

Dado /^que eu tenho uma instituição com razão social "([^"]*)"$/ do |razao_social|
  @instituicao_com_nome = Factory.create :instituicao, :nome => "UENF3",
                                                       :razao_social => razao_social
end

