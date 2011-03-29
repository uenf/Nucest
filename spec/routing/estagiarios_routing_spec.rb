# -*- encoding : utf-8 -*-
require "spec_helper"

describe EstagiariosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/estagiarios" }.should route_to(:controller => "estagiarios", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/estagiarios/new" }.should route_to(:controller => "estagiarios", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/estagiarios/1" }.should route_to(:controller => "estagiarios", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/estagiarios/1/edit" }.should route_to(:controller => "estagiarios", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/estagiarios" }.should route_to(:controller => "estagiarios", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/estagiarios/1" }.should route_to(:controller => "estagiarios", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/estagiarios/1" }.should route_to(:controller => "estagiarios", :action => "destroy", :id => "1")
    end

  end
end
