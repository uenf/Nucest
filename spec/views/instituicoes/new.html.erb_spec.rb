# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "instituicoes/new.html.erb" do
  before(:each) do
    assign(:instituicao, stub_model(Instituicao).as_new_record)
  end

  it "renders new instituicao form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => instituicoes_path, :method => "post" do
    end
  end
end
