#language: pt

Funcionalidade: Manipular convênio
  Como um usuário
  Eu quero manipular os convênios
  Para que eu possa vincular à instituição

  Esquema do Cenário: Cadastrar um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de convênios da instituição
    E eu <Seleciono ou não> "UENF concedente" em "Tipo"
    Então eu devo ver "<Mensagem>"
    E eu devo ter <N> convênios

  Exemplos: Dados inválidos
    | Seleciono ou não | Mensagem                         | N |
    | seleciono        | Convênio cadastrado com sucesso. | 1 |
    | não seleciono    | não pode ser vazio.              | 0 |



  @javascript
  Cenário: Excluir um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 convênios

