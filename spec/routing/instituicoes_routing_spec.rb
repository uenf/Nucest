# -*- encoding : utf-8 -*-
require "spec_helper"

describe InstituicoesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/instituicoes" }.should route_to(:controller => "instituicoes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/instituicoes/new" }.should route_to(:controller => "instituicoes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/instituicoes/1" }.should route_to(:controller => "instituicoes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/instituicoes/1/edit" }.should route_to(:controller => "instituicoes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/instituicoes" }.should route_to(:controller => "instituicoes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/instituicoes/1" }.should route_to(:controller => "instituicoes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/instituicoes/1" }.should route_to(:controller => "instituicoes", :action => "destroy", :id => "1")
    end

  end
end
