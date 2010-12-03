require 'spec_helper'

describe RepresentantesController do

  def mock_representante(stubs={})
    (@mock_representante ||= mock_model(Representante).as_null_object).tap do |representante|
      representante.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all representantes as @representantes" do
      Representante.stub(:all) { [mock_representante] }
      get :index
      assigns(:representantes).should eq([mock_representante])
    end
  end

  describe "GET show" do
    it "assigns the requested representante as @representante" do
      Representante.stub(:find).with("37") { mock_representante }
      get :show, :id => "37"
      assigns(:representante).should be(mock_representante)
    end
  end

  describe "GET new" do
    it "assigns a new representante as @representante" do
      Representante.stub(:new) { mock_representante }
      get :new
      assigns(:representante).should be(mock_representante)
    end
  end

  describe "GET edit" do
    it "assigns the requested representante as @representante" do
      Representante.stub(:find).with("37") { mock_representante }
      get :edit, :id => "37"
      assigns(:representante).should be(mock_representante)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created representante as @representante" do
        Representante.stub(:new).with({'these' => 'params'}) { mock_representante(:save => true) }
        post :create, :representante => {'these' => 'params'}
        assigns(:representante).should be(mock_representante)
      end

      it "redirects to the created representante" do
        Representante.stub(:new) { mock_representante(:save => true) }
        post :create, :representante => {}
        response.should redirect_to(representante_url(mock_representante))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved representante as @representante" do
        Representante.stub(:new).with({'these' => 'params'}) { mock_representante(:save => false) }
        post :create, :representante => {'these' => 'params'}
        assigns(:representante).should be(mock_representante)
      end

      it "re-renders the 'new' template" do
        Representante.stub(:new) { mock_representante(:save => false) }
        post :create, :representante => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested representante" do
        Representante.should_receive(:find).with("37") { mock_representante }
        mock_representante.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :representante => {'these' => 'params'}
      end

      it "assigns the requested representante as @representante" do
        Representante.stub(:find) { mock_representante(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:representante).should be(mock_representante)
      end

      it "redirects to the representante" do
        Representante.stub(:find) { mock_representante(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(representante_url(mock_representante))
      end
    end

    describe "with invalid params" do
      it "assigns the representante as @representante" do
        Representante.stub(:find) { mock_representante(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:representante).should be(mock_representante)
      end

      it "re-renders the 'edit' template" do
        Representante.stub(:find) { mock_representante(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested representante" do
      Representante.should_receive(:find).with("37") { mock_representante }
      mock_representante.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the representantes list" do
      Representante.stub(:find) { mock_representante }
      delete :destroy, :id => "1"
      response.should redirect_to(representantes_url)
    end
  end

end
