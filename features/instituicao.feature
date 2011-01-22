#language: pt

Funcionalidade: Manipular instituições
  Como um usuário
  Eu quero manipular as instituições
  Para que eu possa usar suas informações

  Esquema do Cenário: Cadastrar uma instituição com sucesso
    Dado que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome" com "<Nome>"
    E eu preencho "CNPJ" com "<CNPJ>"
    E eu preencho "Sigla" com "<Sigla>"
    E eu preencho "Tipo" com "<Tipo>"
    E eu preencho "Razão social" com "<Razão social>"
    E eu preencho "Tipo de convênio" com "<Tipo de convênio>"
    E eu preencho "CEP" com "<CEP>"
    E eu preencho "Estado" com "<Estado>"
    E eu preencho "Cidade" com "<Cidade>"
    E eu preencho "Bairro" com "<Bairro>"
    E eu preencho "Rua" com "<Rua>"
    E eu preencho "Número" com "<Número>"
    E eu preencho "Complemento" com "<Complemento>"
    E eu preencho "Telefone" com "<Telefone>"
    E eu preencho "Celular" com "<Celular>"
    E eu preencho "Caixa postal" com "<Caixa postal>"
    E eu preencho "E-mail" com "<E-mail>"
    E eu preencho "Site" com "<Site>"
    E eu preencho "Início" com "<Início>"
    E eu preencho "Fim" com "<Fim>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter 1 instituições

    Exemplos: Dados válidos
        | Nome       | CNPJ               | Sigla | Tipo    | Razão social | Tipo de convênio       | CEP      | Estado         | Cidade                | Bairro | Rua   | Número | Complemento | Telefone   | Celular    | Caixa postal | E-mail            | Site                  | Início     | Fim        | Mensagem                            |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | Instituição cadastrada com sucesso. |


  Esquema do Cenário: Cadastrar uma instituição sem sucesso
    Dado que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome" com "<Nome>"
    E eu preencho "CNPJ" com "<CNPJ>"
    E eu preencho "Sigla" com "<Sigla>"
    E eu preencho "Tipo" com "<Tipo>"
    E eu preencho "Razão social" com "<Razão social>"
    E eu preencho "Tipo de convênio" com "<Tipo de convênio>"
    E eu preencho "CEP" com "<CEP>"
    E eu preencho "Estado" com "<Estado>"
    E eu preencho "Cidade" com "<Cidade>"
    E eu preencho "Bairro" com "<Bairro>"
    E eu preencho "Rua" com "<Rua>"
    E eu preencho "Número" com "<Número>"
    E eu preencho "Complemento" com "<Complemento>"
    E eu preencho "Telefone" com "<Telefone>"
    E eu preencho "Celular" com "<Celular>"
    E eu preencho "Caixa postal" com "<Caixa postal>"
    E eu preencho "E-mail" com "<E-mail>"
    E eu preencho "Site" com "<Site>"
    E eu preencho "Início" com "<Início>"
    E eu preencho "Fim" com "<Fim>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter 0 instituições

    Exemplos: Dados inválidos
        | Nome       | CNPJ               | Sigla | Tipo    | Razão social | Tipo de convênio       | CEP      | Estado         | Cidade                | Bairro | Rua   | Número | Complemento | Telefone   | Celular    | Caixa postal | E-mail            | Site                  | Início     | Fim        | Mensagem             |
        |            | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | não pode ser vazio.  |
        | Algum nome | 00.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | numero invalido      |
        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa     | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | não é válido.        |
        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | sitedaempresa         | 11/09/2001 | 11/10/2001 | não é válido.        |
        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 03/27/2001 | 11/10/2001 | não é válida.        |
        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 03/27/2001 | não é válida.        |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700-A        | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | não é um número.     |


  Cenário: Nome da instituição deve ser único
    Dado que eu tenho uma instituição com nome "UENF"
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome" com "UENF"
    E eu pressiono "Salvar"
    Então eu devo ver "já está em uso."
    E eu devo ter 1 instituições


  Cenário: CNPJ da instituição deve ser único
    Dado que eu tenho uma instituição com CNPJ "69.103.604/0001-60"
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "CNPJ" com "69.103.604/0001-60"
    E eu pressiono "Salvar"
    Então eu devo ver "já está em uso."
    E eu devo ter 1 instituições

