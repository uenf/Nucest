#language: pt

Funcionalidade: Manipular tramitações
  Como um usuário
  Eu quero manipular as tramitações
  Para que eu possa usar suas informações

  @javascript
  Cenário: Cadastrar um item da tramitação com sucesso
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
    E eu pressiono "Salvar"
    E eu devo ver "20/11/2010" em "#itens_tramitacao"
    E eu devo ver "Telefone" em "#itens_tramitacao"
    E eu devo ver "E-mail" em "#itens_tramitacao"
    E eu devo ver "descriçao" em "#itens_tramitacao"

  @javascript
  Esquema do Cenário: Cadastrar um item da tramitação sem sucesso
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    Quando eu clico em "Tramitação"
    E eu espero 1 segundo
    E eu clico em "Nova entrada"
    E eu espero 1 segundo
    E eu preencho "Data" com "<Data>"
    E eu preencho "Origem do contato" com "<Origem do contato>"
    E eu preencho "Forma de contato" com "<Forma de contato>"
    E eu preencho "Descrição" com "<Descrição>"
    E eu pressiono "Salvar"
    Então eu devo ter 0 item de tramitação
    E eu devo ver "<Mensagem>"

    Exemplos:
    | Data       | Origem do contato | Forma de contato | Descrição        | Mensagem            |
    |            | Fulano de tal     | E-mail           | Alguma descrição | não pode ser vazio. |
    | 20/11/2010 |                   | E-mail           | Alguma descrição | não pode ser vazio. |
    | 20/11/2010 | Fulano de tal     |                  | Alguma descrição | não pode ser vazio. |
    | 20/11/2010 | Fulano de tal     | E-mail           |                  | não pode ser vazio. |
    | 11/20/2010 | Fulano de tal     | E-mail           | Alguma descrição | não é válida.       |

