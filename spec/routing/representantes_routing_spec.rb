# -*- encoding : utf-8 -*-
require "spec_helper"

describe RepresentantesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "instituicoes/1/representantes" }.should route_to(:controller => "representantes", :action => "index", :instituicao_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "instituicoes/1/representantes/new" }.should route_to(:controller => "representantes", :action => "new", :instituicao_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "instituicoes/1/representantes/1" }.should route_to(:controller => "representantes", :action => "show", :id => "1", :instituicao_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "instituicoes/1/representantes/1/edit" }.should route_to(:controller => "representantes", :action => "edit", :id => "1", :instituicao_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "instituicoes/1/representantes" }.should route_to(:controller => "representantes", :action => "create", :instituicao_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "instituicoes/1/representantes/1" }.should route_to(:controller => "representantes", :action => "update", :id => "1", :instituicao_id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "instituicoes/1/representantes/1" }.should route_to(:controller => "representantes", :action => "destroy", :id => "1", :instituicao_id => "1")
    end

  end
end

