# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Supervisores" do
  describe "GET /supervisores" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      instituicao = Factory.create :instituicao
      get instituicao_supervisores_path(instituicao)
      response.status.should be(200)
    end
  end
end

