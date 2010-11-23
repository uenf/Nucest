# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "instituicoes/edit.html.erb" do
  before(:each) do
    @instituicao = assign(:instituicao, stub_model(Instituicao,
      :new_record? => false
    ))
  end

  it "renders the edit instituicao form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => instituicao_path(@instituicao), :method => "post" do
    end
  end
end
