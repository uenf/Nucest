require 'spec_helper'

describe "representantes/show.html.erb" do
  before(:each) do
    @representante = assign(:representante, stub_model(Representante,
      :nome => "Nome",
      :funcao => "Funcao",
      :rg => "Rg",
      :orgado_expedidor => "Orgado_expedidor",
      :cpf => "Cpf",
      :telefone => "Telefone",
      :celular => "Celular",
      :email => "Email",
      :instituicao => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Funcao/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rg/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Orgado_expedidor/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cpf/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Telefone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Celular/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
