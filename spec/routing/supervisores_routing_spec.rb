require "spec_helper"

describe SupervisoresController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/supervisores" }.should route_to(:controller => "supervisores", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/supervisores/new" }.should route_to(:controller => "supervisores", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/supervisores/1" }.should route_to(:controller => "supervisores", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/supervisores/1/edit" }.should route_to(:controller => "supervisores", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/supervisores" }.should route_to(:controller => "supervisores", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/supervisores/1" }.should route_to(:controller => "supervisores", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/supervisores/1" }.should route_to(:controller => "supervisores", :action => "destroy", :id => "1")
    end

  end
end
