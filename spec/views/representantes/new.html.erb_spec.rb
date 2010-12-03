require 'spec_helper'

describe "representantes/new.html.erb" do
  before(:each) do
    assign(:representante, stub_model(Representante,
      :nome => "MyString",
      :funcao => "MyString",
      :rg => "MyString",
      :orgado_expedidor => "MyString",
      :cpf => "MyString",
      :telefone => "MyString",
      :celular => "MyString",
      :email => "MyString",
      :instituicao => nil
    ).as_new_record)
  end

  it "renders new representante form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => representantes_path, :method => "post" do
      assert_select "input#representante_nome", :name => "representante[nome]"
      assert_select "input#representante_funcao", :name => "representante[funcao]"
      assert_select "input#representante_rg", :name => "representante[rg]"
      assert_select "input#representante_orgado_expedidor", :name => "representante[orgado_expedidor]"
      assert_select "input#representante_cpf", :name => "representante[cpf]"
      assert_select "input#representante_telefone", :name => "representante[telefone]"
      assert_select "input#representante_celular", :name => "representante[celular]"
      assert_select "input#representante_email", :name => "representante[email]"
      assert_select "input#representante_instituicao", :name => "representante[instituicao]"
    end
  end
end
