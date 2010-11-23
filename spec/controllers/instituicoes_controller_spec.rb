# -*- encoding : utf-8 -*-
require 'spec_helper'

describe InstituicoesController do

  def mock_instituicao(stubs={})
    (@mock_instituicao ||= mock_model(Instituicao).as_null_object).tap do |instituicao|
      instituicao.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all instituicoes as @instituicoes" do
      Instituicao.stub(:all) { [mock_instituicao] }
      get :index
      assigns(:instituicoes).should eq([mock_instituicao])
    end
  end

  describe "GET show" do
    it "assigns the requested instituicao as @instituicao" do
      Instituicao.stub(:find).with("37") { mock_instituicao }
      get :show, :id => "37"
      assigns(:instituicao).should be(mock_instituicao)
    end
  end

  describe "GET new" do
    it "assigns a new instituicao as @instituicao" do
      Instituicao.stub(:new) { mock_instituicao }
      get :new
      assigns(:instituicao).should be(mock_instituicao)
    end
  end

  describe "GET edit" do
    it "assigns the requested instituicao as @instituicao" do
      Instituicao.stub(:find).with("37") { mock_instituicao }
      get :edit, :id => "37"
      assigns(:instituicao).should be(mock_instituicao)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created instituicao as @instituicao" do
        Instituicao.stub(:new).with({'these' => 'params'}) { mock_instituicao(:save => true) }
        post :create, :instituicao => {'these' => 'params'}
        assigns(:instituicao).should be(mock_instituicao)
      end

      it "redirects to the created instituicao" do
        Instituicao.stub(:new) { mock_instituicao(:save => true) }
        post :create, :instituicao => {}
        response.should redirect_to(instituicao_url(mock_instituicao))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved instituicao as @instituicao" do
        Instituicao.stub(:new).with({'these' => 'params'}) { mock_instituicao(:save => false) }
        post :create, :instituicao => {'these' => 'params'}
        assigns(:instituicao).should be(mock_instituicao)
      end

      it "re-renders the 'new' template" do
        Instituicao.stub(:new) { mock_instituicao(:save => false) }
        post :create, :instituicao => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested instituicao" do
        Instituicao.should_receive(:find).with("37") { mock_instituicao }
        mock_instituicao.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :instituicao => {'these' => 'params'}
      end

      it "assigns the requested instituicao as @instituicao" do
        Instituicao.stub(:find) { mock_instituicao(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:instituicao).should be(mock_instituicao)
      end

      it "redirects to the instituicao" do
        Instituicao.stub(:find) { mock_instituicao(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(instituicao_url(mock_instituicao))
      end
    end

    describe "with invalid params" do
      it "assigns the instituicao as @instituicao" do
        Instituicao.stub(:find) { mock_instituicao(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:instituicao).should be(mock_instituicao)
      end

      it "re-renders the 'edit' template" do
        Instituicao.stub(:find) { mock_instituicao(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested instituicao" do
      Instituicao.should_receive(:find).with("37") { mock_instituicao }
      mock_instituicao.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the instituicoes list" do
      Instituicao.stub(:find) { mock_instituicao }
      delete :destroy, :id => "1"
      response.should redirect_to(instituicoes_url)
    end
  end

end
