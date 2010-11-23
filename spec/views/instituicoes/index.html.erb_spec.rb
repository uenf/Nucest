# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "instituicoes/index.html.erb" do
  before(:each) do
    assign(:instituicoes, [
      stub_model(Instituicao),
      stub_model(Instituicao)
    ])
  end

  it "renders a list of instituicoes" do
    render
  end
end
