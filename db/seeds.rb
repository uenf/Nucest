# -*- encoding : utf-8 -*-
# Limpa o banco de dados
Usuario.delete_all
Instituicao.delete_all
Area.delete_all
Representante.delete_all
Supervisor.delete_all

Usuario.create(
  :email => 'roosmaia@uenf.br',
  :password => 'hugo123',
  :password_confirmation => 'hugo123'
)

Instituicao.create(
  :nome => 'Universidade Estadual do Norte Fluminense',
  :sigla => 'UENF',
  :tipo => Instituicao::TIPO_DE_INSTITUICAO['Instituição de ensino']
)

modelo_de_instituicao = Instituicao.create(
  :nome => 'Modelo de instituição',
  :origem => Instituicao::ORIGEM['Nacional'],
  :pais => 'Brasil',
  :cnpj => '17.516.113/0001-47',
  :sigla => 'MDI',
  :tipo => Instituicao::TIPO_DE_INSTITUICAO['Empresa'],
  :razao_social => 'Modelo de instituição LTDA',
  :cep => '28.015-200',
  :estado => 'RJ',
  :cidade => 'Campos dos Goytacazes',
  :bairro => 'Flamboyant',
  :rua => 'Rua Herculano Aquino',
  :numero => '119',
  :complemento => 'Loja 1',
  :telefone => '(22) 2222-2222',
  :celular => '(99) 9999-9999',
  :fax => '(33) 3333-3333',
  :caixa_postal => '970',
  :email => 'modelo@instituicaomodelo.com'
)

p modelo_de_instituicao.errors
Representante.create(
  :nome => 'Fulano Representante da Instituição Modelo',
  :funcao => 'Represente da empresa',
  :rg => '24.594.667-8',
  :orgao_expedidor => 'Detran - RJ',
  :cpf => '131.572.887-76',
  :telefone => '(44) 4444-4444',
  :celular => '(00) 0000-0000',
  :email => 'representante@instituicaomodelo.com',
  :instituicao => modelo_de_instituicao
)

Supervisor.create(
  :nome => 'Supervisor da Instituição Modelo',
  :lotacao => 'Lotação do Supervisor',
  :matricula => '555555',
  :funcao => 'Supervisor Geral',
  :telefone => '(55) 5555-5551',
  :celular => '(55) 5555-5552',
  :email => 'supervisor@instituicaomodelo.com',
  :instituicao => modelo_de_instituicao
)

Convenio.create(
  :numero => '2012-999',
  :tipo => Convenio::TIPO['Instituição concedente'],
  :situacao => Convenio::SITUACAO['Em vigência'],
  :inicio => '27/03/2000',
  :fim => '27/03/2020',
  :instituicao => modelo_de_instituicao
)

30.times do |i|
	Instituicao.create(
	  :nome => 'Instituição de exemplo ' + i.to_s,
	  :sigla => 'IDE',
	  :tipo => Instituicao::TIPO_DE_INSTITUICAO['Instituição de ensino']
	)
end
