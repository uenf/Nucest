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
    | Nome       | CNPJ  | Sigla | Tipo    | Razão social | Tipo de convênio       | CEP       | Estado         | Cidade                | Bairro | Rua   | Número | Complemento | Telefone       | Celular        | Caixa Postal | E-mail            | Site                  | Início   | Fim      | Mensagem                            |
    | Algum Nome | 123-A | PTR   | Empresa | Petrobras    | Instituição concedente | 28000-000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | (22) 2722-2222 | (22) 9888-8888 | 700          | email@empresa.com | www.sitedaempresa.com | Setembro | Dezembro | Instituição cadastrada com sucesso. |


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
    | Nome       | CNPJ  | Sigla | Tipo    | Razão social | Tipo de convênio       | CEP       | Estado         | Cidade                | Bairro | Rua   | Número | Complemento | Telefone       | Celular        | Caixa Postal | E-mail            | Site                  | Início   | Fim      | Mensagem            |
    |            | 123-A | PTR   | Empresa | Petrobras    | Instituição concedente | 28000-000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | (22) 2722-2222 | (22) 9888-8888 | 700          | email@empresa.com | www.sitedaempresa.com | Setembro | Dezembro | não pode ser vazio. |
    | Algum nome |       | PTR   | Empresa | Petrobras    | Instituição concedente | 28000-000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | (22) 2722-2222 | (22) 9888-8888 | 700          | email@empresa.com | www.sitedaempresa.com | Setembro | Dezembro | não pode ser vazio. |
    | Algum nome | 123-A | PTR   | Empresa | Petrobras    | Instituição concedente | 28000-000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | abc    | ap 1        | (22) 2722-2222 | (22) 9888-8888 | 700          | email@empresa.com | www.sitedaempresa.com | Setembro | Dezembro | não é válido.       |
    | Algum nome | 123-A | PTR   | Empresa | Petrobras    | Instituição concedente | 28000-000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | (22) 2722-2222 | (22) 9888-8888 | 700          | email@empresa     | www.sitedaempresa.com | Setembro | Dezembro | não é válido.       |
    | Algum nome | 123-A | PTR   | Empresa | Petrobras    | Instituição concedente | 28000-000 | Rio de Janeiro | Campos dos Goytacazes | Centro | Rua A | 123    | ap 1        | (22) 2722-2222 | (22) 9888-8888 | 700          | email@empresa.com | sitedaempresa         | Setembro | Dezembro | não é válido.       |

