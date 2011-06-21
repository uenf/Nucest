#language: pt

Funcionalidade: Manipular tramitações
  Como um usuário
  Eu quero manipular as tramitações
  Para que eu possa usar suas informações

  @javascript
  Cenário: Cadastrar e excluir um item da tramitação
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    Quando eu clico em "Tramitação"
    E eu espero 1 segundo
    E eu clico em "Nova entrada"
    E eu espero 1 segundo
    E eu preencho "Data" com "20/11/2010"
    E eu preencho "Origem do contato" com "Telefone"
    E eu preencho "Forma de contato" com "E-mail"
    E eu preencho "Descrição" com "descriçao"
    E eu pressiono "item_tramitacao_submit"
    Então eu devo ter 1 item de tramitação
    E eu devo ver "20/11/2010" em "#tramitacao"
    E eu devo ver "Telefone" em "#tramitacao"
    E eu devo ver "E-mail" em "#tramitacao"
    E eu devo ver "descriçao" em "#tramitacao"
    E eu clico em "Excluir" em "#tramitacao" e pressiono "OK" no popup
    Então eu devo ter 0 item de tramitação
    E eu não devo ver "20/11/2010" em "#tramitacao"
    E eu não devo ver "Telefone" em "#tramitacao"
    E eu não devo ver "E-mail" em "#tramitacao"
    E eu não devo ver "descriçao" em "#tramitacao"

