require 'spec_helper'

describe "representantes/index.html.erb" do
  before(:each) do
    assign(:representantes, [
      stub_model(Representante,
        :nome => "Nome",
        :funcao => "Funcao",
        :rg => "Rg",
        :orgado_expedidor => "Orgado_expedidor",
        :cpf => "Cpf",
        :telefone => "Telefone",
        :celular => "Celular",
        :email => "Email",
        :instituicao => nil
      ),
      stub_model(Representante,
        :nome => "Nome",
        :funcao => "Funcao",
        :rg => "Rg",
        :orgado_expedidor => "Orgado_expedidor",
        :cpf => "Cpf",
        :telefone => "Telefone",
        :celular => "Celular",
        :email => "Email",
        :instituicao => nil
      )
    ])
  end

  it "renders a list of representantes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Funcao".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Orgado_expedidor".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
