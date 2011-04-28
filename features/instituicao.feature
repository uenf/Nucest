#language: pt

Funcionalidade: Manipular instituições
  Como um usuário
  Eu quero manipular as instituições
  Para que eu possa usar suas informações

  Esquema do Cenário: Cadastrar uma instituição brasileira com sucesso
    Dado que eu estou logado
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome fantasia" com "<Nome>"
    E eu seleciono "Nacional" em "Origem"
    E eu preencho "CNPJ" com "<CNPJ>"
    E eu preencho "Sigla" com "<Sigla>"
    E eu seleciono "<Tipo>" em "Tipo"
    E eu preencho "Razão social" com "<Razão social>"
    E eu seleciono "<Tipo de convênio>" em "Tipo de convênio"
    E eu preencho "CEP" com "<CEP>"
    E eu seleciono "<Estado>" em "Estado"
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
    E eu devo ter 1 instituição

    Exemplos: Dados válidos
        | Nome       | CNPJ               | Sigla | Tipo                  | Razão social | Tipo de convênio       | CEP      | Estado         | Cidade                | Bairro | Rua   | Número | Complemento | Telefone   | Celular    | Caixa postal | E-mail            | Site                  | Início     | Fim        | Mensagem                            |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Empresa               | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | Instituição cadastrada com sucesso. |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Instituição de ensino | Petrobras    | UENF concedente        | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | Instituição cadastrada com sucesso. |

  Esquema do Cenário: Cadastrar uma instituição brasileira sem sucesso
    Dado que eu estou logado
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome fantasia" com "<Nome>"
    E eu seleciono "Nacional" em "Origem"
    E eu preencho "CNPJ" com "<CNPJ>"
    E eu preencho "Sigla" com "<Sigla>"
    E eu seleciono "<Tipo>" em "Tipo"
    E eu preencho "Razão social" com "<Razão social>"
    E eu seleciono "<Tipo de convênio>" em "Tipo de convênio"
    E eu preencho "CEP" com "<CEP>"
    E eu seleciono "<Estado>" em "Estado"
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
#        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 03/27/2001 | 11/10/2001 | não é válida.        |
#        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 03/27/2001 | não é válida.        |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700-A        | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | não é um número.     |

  Esquema do Cenário: Cadastrar uma instituição estrangeira com sucesso
    Dado que eu estou logado
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome fantasia" com "<Nome>"
    E eu seleciono "Estrangeira" em "Origem"
    E eu preencho "País" com "Peru"
    E eu preencho "Registro local" com "123456/abc"
    E eu preencho "Sigla" com "<Sigla>"
    E eu seleciono "<Tipo>" em "Tipo"
    E eu preencho "Razão social" com "<Razão social>"
    E eu seleciono "<Tipo de convênio>" em "Tipo de convênio"
    E eu preencho "CEP" com "<CEP>"
    E eu seleciono "<Estado>" em "Estado"
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
    E eu devo ter 1 instituição

    Exemplos: Dados válidos
        | Nome       | CNPJ               | Sigla | Tipo                  | Razão social | Tipo de convênio       | CEP      | Estado         | Cidade                | Bairro | Rua   | Número | Complemento | Telefone   | Celular    | Caixa postal | E-mail            | Site                  | Início     | Fim        | Mensagem                            |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Empresa               | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | Instituição cadastrada com sucesso. |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Instituição de ensino | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | Instituição cadastrada com sucesso. |

  Esquema do Cenário: Cadastrar uma instituição estrangeira sem sucesso
    Dado que eu estou logado
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome fantasia" com "<Nome>"
    E eu seleciono "Estrangeira" em "Origem"
    E eu preencho "País" com "Peru"
    E eu preencho "Registro local" com "123456/abc"
    E eu preencho "Sigla" com "<Sigla>"
    E eu seleciono "<Tipo>" em "Tipo"
    E eu preencho "Razão social" com "<Razão social>"
    E eu seleciono "<Tipo de convênio>" em "Tipo de convênio"
    E eu preencho "CEP" com "<CEP>"
    E eu seleciono "<Estado>" em "Estado"
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
        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa     | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | não é válido.        |
        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | sitedaempresa         | 11/09/2001 | 11/10/2001 | não é válido.        |
#        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 03/27/2001 | 11/10/2001 | não é válida.        |
#        | Algum nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700          | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 03/27/2001 | não é válida.        |
        | Algum Nome | 69.103.604/0001-60 | PTR   | Empresa | Petrobras    | Instituição concedente | 28000000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | 2222222222 | 2298888888 | 700-A        | email@empresa.com | www.sitedaempresa.com | 11/09/2001 | 11/10/2001 | não é um número.     |

  Cenário: Cadastrar instituição com nome já cadastrado
    Dado que eu estou logado
    E que eu tenho uma instituição com nome "UENF"
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Nome fantasia" com "UENF"
    E eu pressiono "Salvar"
    Então eu devo ver "já está em uso."
    E eu devo ter 1 instituição

  Cenário: Cadastrar instituição com CNPJ já cadastrado
    Dado que eu estou logado
    E que eu tenho uma instituição com CNPJ "69.103.604/0001-60"
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "CNPJ" com "69.103.604/0001-60"
    E eu pressiono "Salvar"
    Então eu devo ver "já está em uso."
    E eu devo ter 1 instituição

  Cenário: Cadastrar instituição com razão social já cadastrado
    Dado que eu estou logado
    E que eu tenho uma instituição com razão social "Santander S.A"
    E que eu estou na página de cadastro de instituições
    Quando eu preencho "Razão social" com "Santander S.A"
    E eu pressiono "Salvar"
    Então eu devo ver "já está em uso."
    E eu devo ter 1 instituição

  Cenário: Gerar termo de convênio sem ter cadastrado o tipo de convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu não tenho o tipo de convênio cadastrado
    E que eu estou na página de edição da instituição
    Quando eu clico em "Gerar termo de convênio"
    Então eu devo estar na página de edição da instituição
    E eu devo ver "Cadastre o tipo de convênio antes de gerar o termo."

  @javascript
  Cenário: Excluir uma instituição
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de instituições
    Quando eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 instituições

  @javascript
  Cenário: Buscar e ordenar a lista de instituições
    Dado que eu estou logado
    E que eu tenho uma instituição com nome "Teste a1"
    E que eu tenho uma instituição com nome "Teste a2"
    E que eu tenho uma instituição com nome "Teste b1"
    E que eu estou na página de instituições
    Quando eu preencho "search_nome_or_razao_social_contains" com "Teste"
    Então eu devo ver a tabela com:
      | Nome ▲      |
      | Teste a1 |
      | Teste a2 |
      | Teste b1 |
    Quando eu preencho "search_nome_or_razao_social_contains" com "Teste a"
    E eu espero 1 segundo
    Então eu devo ver a tabela com:
      | Nome ▲      |
      | Teste a1 |
      | Teste a2 |
    Quando eu clico em "Nome"
    E eu espero 1 segundo
    Então eu devo ver a tabela com:
      | Nome ▼      |
      | Teste a2 |
      | Teste a1 |

