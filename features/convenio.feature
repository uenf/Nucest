#language: pt

Funcionalidade: Manipular convênio
  Como um usuário
  Eu quero manipular os convênios
  Para que eu possa vincular à instituição

  Cenário: Cadastrar um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de convênios da instituição
    E eu seleciono "UENF concedente" em "Tipo"
    E eu pressiono "Salvar"
    Então eu devo ver "Convênio cadastrado com sucesso."
    E eu devo ter 1 convênios
    E a situação do convênio deve ser "Em tramitação"

  @javascript
  Cenário: Excluir um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 convênios

