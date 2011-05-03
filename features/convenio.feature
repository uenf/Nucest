#language: pt

Funcionalidade: Manipular convênio
  Como um usuário
  Eu quero manipular os convênios
  Para que eu possa vincular à instituição

  Esquema do Cenário: Cadastrar um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de cadastro de convênios
    Quando eu preencho "Número" com "<Número>"
    E eu <Seleciono ou não> "UENF concedente" em "Tipo"
    E eu preencho "Início" com "<Início>"
    E eu preencho "Fim" com "<Fim>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter <N> convênios

  Exemplos: Dados inválidos
    | Número | Seleciono ou não | Início     | Fim        | Mensagem                         | N |
    | 123    | seleciono        | 01/01/2001 | 10/10/2010 | Convênio cadastrado com sucesso. | 1 |
    |        | seleciono        | 01/01/2001 | 10/10/2010 | não pode ser vazio.              | 0 |
    | 123    | não seleciono    | 01/01/2001 | 10/10/2010 | não pode ser vazio.              | 0 |
    | 123    | seleciono        |            | 10/10/2010 | não pode ser vazio.              | 0 |
    | 123    | seleciono        | 01/01/2001 |            | não pode ser vazio.              | 0 |

  @javascript
  Cenário: Excluir um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 convênios

