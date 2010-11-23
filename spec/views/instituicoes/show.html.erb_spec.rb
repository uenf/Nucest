# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "instituicoes/show.html.erb" do
  before(:each) do
    @instituicao = assign(:instituicao, stub_model(Instituicao))
  end

  it "renders attributes in <p>" do
    render
  end
end
