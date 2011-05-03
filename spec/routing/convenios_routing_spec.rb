# -*- encoding : utf-8 -*-
require "spec_helper"

describe ConveniosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "instituicoes/1/convenios" }.should route_to(:controller => "convenios", :action => "index", :instituicao_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "instituicoes/1/convenios/new" }.should route_to(:controller => "convenios", :action => "new", :instituicao_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "instituicoes/1/convenios/1" }.should route_to(:controller => "convenios", :action => "show", :id => "1", :instituicao_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "instituicoes/1/convenios/1/edit" }.should route_to(:controller => "convenios", :action => "edit", :id => "1", :instituicao_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "instituicoes/1/convenios" }.should route_to(:controller => "convenios", :action => "create", :instituicao_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "instituicoes/1/convenios/1" }.should route_to(:controller => "convenios", :action => "update", :id => "1", :instituicao_id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "instituicoes/1/convenios/1" }.should route_to(:controller => "convenios", :action => "destroy", :id => "1", :instituicao_id => "1")
    end

  end
end

