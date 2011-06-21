# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AreasHelper do

  it "retornar o conteúdo do ítem da lista de áreas" do
    instituicao = Factory.create :instituicao

    area = Factory.create :area, :nome => 'area', :id => 1, :instituicao_ids => [ instituicao.id ]
    helper.item_da_lista_de_areas(area, instituicao).should == "<input type=\"checkbox\" name=\"instituicao[area_ids][]\" value=\"1\" checked=\"checked\"/><span>area <a href=\"/areas/1/new\" class=\"button\">Nova sub-area</a></span>"

    area = Factory.create :area, :nome => 'area2', :id => 2
    helper.item_da_lista_de_areas(area, instituicao).should == "<input type=\"checkbox\" name=\"instituicao[area_ids][]\" value=\"2\" /><span>area2 <a href=\"/areas/2/new\" class=\"button\">Nova sub-area</a></span>"
  end

  it "gerar lista de áreas" do
    instituicao = Factory.create :instituicao
    a = Factory.create :area, :nome => 'a', :id => 1, :instituicao_ids => [ instituicao.id ]
    b = Factory.create :area, :nome => 'b', :id => 2
    c = Factory.create :area, :nome => 'c', :father_id => a.id, :id => 3
    d = Factory.create :area, :nome => 'd', :father_id => a.id, :id => 4
    e = Factory.create :area, :nome => 'e', :father_id => c.id, :id => 5

    helper.lista_de_areas(Area.arvore, instituicao).should == "<ul><li>"+ item_da_lista_de_areas(a, instituicao) + "<ul><li>" + item_da_lista_de_areas(c, nil) + "<ul><li>" + item_da_lista_de_areas(e, nil) + "</li></ul></li><li>" + item_da_lista_de_areas(d, nil) + "</li></ul></li><li>" + item_da_lista_de_areas(b, nil) + "</li></ul>"
  end

end

