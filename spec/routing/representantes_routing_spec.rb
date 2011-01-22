# -*- encoding : utf-8 -*-
require "spec_helper"

describe RepresentantesController do
  describe "routing" do

    it "recognizes and generates #index" do
      assert_recognizes({:controller => "representantes", :action => "index", :instituicao_id => "1"}, "/instituicoes/1/representantes")
    end

    it "recognizes and generates #new" do
      assert_recognizes({:controller => "representantes", :action => "new", :instituicao_id => "1"}, "/instituicoes/1/representantes/new")
    end

    it "recognizes and generates #show" do
      assert_recognizes({:controller => "representantes", :action => "show", :id => "1", :instituicao_id => "1"}, "/instituicoes/1/representantes/1")
    end

    it "recognizes and generates #edit" do
      assert_recognizes({:controller => "representantes", :action => "edit", :id => "1", :instituicao_id => "1"}, "/instituicoes/1/representantes/1/edit")
    end

    it "recognizes and generates #create" do
      { :post => "/representantes" }.should route_to(:controller => "representantes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/representantes/1" }.should route_to(:controller => "representantes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/representantes/1" }.should route_to(:controller => "representantes", :action => "destroy", :id => "1")
    end

  end
end

