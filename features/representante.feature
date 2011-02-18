#language: pt

Funcionalidade: Manipular representante
  Como um usuário
  Eu quero manipular os representantes
  Para que eu possa usar suas informações no cadastro de instituições

  Esquema do Cenário: Cadastrar um representante com sucesso
    Dado que eu tenho uma instituição
    E que eu estou na página de cadastro de representantes
    Quando eu preencho "Nome" com "<Nome>"
    E eu preencho "Função" com "<Função>"
    E eu preencho "RG" com "<RG>"
    E eu preencho "Órgão expedidor" com "<Órgão expedidor>"
    E eu preencho "CPF" com "<CPF>"
    E eu preencho "Telefone" com "<Telefone>"
    E eu preencho "Celular" com "<Celular>"
    E eu preencho "E-mail" com "<E-mail>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter 1 representantes
    E o representante deve estar ligado à instituição

  Exemplos: Dados válidos
    | Nome       | Função          | RG            | Órgão expedidor | CPF            | Telefone   | Celular    | E-mail                  | Mensagem                              |
    | Algum Nome | Função qualquer | 00.000.000-00 | Detran-RJ       | 131.572.887-76 | 2222222222 | 2298888888 | email@representante.com | Representante cadastrado com sucesso. |

  Esquema do Cenário: Cadastrar um representante sem sucesso
    Dado que eu tenho uma instituição
    E que eu estou na página de cadastro de representantes
    Quando eu preencho "Nome" com "<Nome>"
    E eu preencho "Função" com "<Função>"
    E eu preencho "RG" com "<RG>"
    E eu preencho "Órgão expedidor" com "<Órgão expedidor>"
    E eu preencho "CPF" com "<CPF>"
    E eu preencho "Telefone" com "<Telefone>"
    E eu preencho "Celular" com "<Celular>"
    E eu preencho "E-mail" com "<E-mail>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter 0 representantes

  Exemplos: Dados inválidos
    | Nome       | Função          | RG            | Órgão expedidor | CPF            | Telefone   | Celular    | E-mail                  | Mensagem            |
    |            | Função qualquer | 00.000.000-00 | Detran-RJ       | 131.572.887-76 | 2222222222 | 2298888888 | email@representante.com | não pode ser vazio. |
    | Algum Nome | Função qualquer | 00.000.000-00 | Detran-RJ       | 000.000.000-00 | 2222222222 | 2298888888 | email@representante.com | numero invalido     |

