#language: pt

Funcionalidade: Manipular supervisor
  Como um usuário
  Eu quero manipular os supervisores
  Para que eu possa usar suas informações no cadastro de instituições

  Cenário: Cadastrar um supervisor com sucesso
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de cadastro de supervisores
    Quando eu preencho "Nome" com "Nome do supervisor"
    E eu preencho "Matrícula" com "123456-2011"
    E eu preencho "Lotação" com "Lotação do supervisor"
    E eu preencho "Função" com "Função do supervisor"
    E eu preencho "Telefone" com "2227351010"
    E eu preencho "Celular" com "2298848808"
    E eu preencho "E-mail" com "email_supervisor@instituicao.com"
    E eu pressiono "Salvar"
    Então eu devo ver "Supervisor cadastrado com sucesso."
    E eu devo ter 1 supervisores
    E o supervisor deve estar ligado à instituição

  Esquema do Cenário: Cadastrar um supervisor sem sucesso
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de cadastro de supervisores
    Quando eu preencho "Nome" com "<Nome>"
    E eu preencho "Matrícula" com "<Matrícula>"
    E eu preencho "Lotação" com "<Lotação>"
    E eu preencho "Função" com "<Função>"
    E eu preencho "Telefone" com "<Telefone>"
    E eu preencho "Celular" com "<Celular>"
    E eu preencho "E-mail" com "<E-mail>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter 0 supervisores

  Exemplos: Dados inválidos
    | Nome               | Matrícula   | Lotação               | Função               | Telefone   | Celular    | E-mail                           | Mensagem            |
    |                    | 123456-2011 | Lotação do supervisor | Função do supervisor | 2227351010 | 2298848808 | email_supervisor@instituicao.com | não pode ser vazio. |
    | Nome do supervisor | 123456-2011 | Lotação do supervisor | Função do supervisor | 2227351010 | 2298848808 | email_supervisor.com             | não é válido.       |

  @javascript
  Cenário: Excluir um supervisor
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um supervisor
    E que eu estou na página de supervisores da instituição
    Quando eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 supervisores

