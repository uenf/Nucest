#language: pt

Funcionalidade: Manipular tramitações
  Como um usuário
  Eu quero manipular as tramitações
  Para que eu possa usar suas informações

  Cenário: Cadastrar uma item da tramitação
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    E eu clico em "Tramitação"
    E eu preencho "Data" com "20/11/2010"
    E eu preencho "Origem do contato" com "Telefone"
    E eu preencho "Forma de contato" com "E-mail"
    E eu preencho "Descrição" com "descriçao"
    E eu pressiono "Salvar"
    Então eu devo ter 1 item de tramitação
    E devo ver "20/11/2010" em "lista_items_tramitacao"
    E devo ver "Telefone" em "lista_items_tramitacao"
    E devo ver "E-mail" em "lista_items_tramitacao"
    E devo ver "descriçao" em "lista_items_tramitacao"

