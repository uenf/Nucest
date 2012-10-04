#language: pt

Funcionalidade: Manipular convênio
  Como um usuário
  Eu quero manipular os convênios
  Para que eu possa vincular à instituição

  Cenário: Iniciar tramitação do convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu estou na página de convênios da instituição
    E eu seleciono "UENF concedente" em "Tipo"
    E eu pressiono "Salvar"
    Então eu devo ver "Convênio cadastrado com sucesso."
    E eu devo ter 1 convênios
    E a situação do convênio deve ser "Em tramitação"

  @javascript
  Cenário: Finalizar tramitação do convênio com sucesso
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio "em tramitação" para esta instituição
    E que eu estou na página de convênios da instituição
    E eu clico em "Tramitação"
    Quando eu clico em "Finalizar tramitação"
    E eu espero 1 segundo
    E eu devo estar na página de finalização da tramitação
    E eu preencho "Número" com "123456"
    E eu preencho "Início" com "10/08/2011"
    E eu preencho "Fim" com "10/08/2020"
    Quando eu pressiono "Salvar"
    Então eu devo estar na página de convênios da instituição
    E eu devo ver "Processo de tramitação finalizada com sucesso."
    E eu devo ver "Em vigência"

  @now
  @javascript
  Esquema do Cenário: Editar uma tramitação do convênio com erro
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio "Em tramitação" para esta instituição
    E que eu estou na página de convênios da instituição
    E eu clico em "Editar"
    E eu espero 2 segundos
    E eu devo estar na página de cadastro dos dados do convênio
    E eu preencho "Número" com "<Número>"
    E eu preencho "Início" com "<Inicio>"
    E eu preencho "Fim" com "<Fim>"
    Quando eu pressiono "Salvar"
    E eu devo ver "<Mensagem>"

    Exemplos: Dados válidos
        | Número | Inicio     | Fim        | Mensagem                                    |
        |        | 18/03/2011 | 16/03/2012 | não pode ser vazio                          |
        | 123    |            | 16/03/2012 | não pode ser vazio                          |
        | 123    | 18/03/2011 |            | não pode ser vazio                          |
        | 123    | 18/03/2011 | 16/03/2011 | data final não pode ser menor que a inicial |

  @javascript
  Cenário: Excluir um convênio
    Dado que eu estou logado
    E que eu tenho uma instituição
    E que eu tenho um convênio
    E que eu estou na página de convênios da instituição
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 convênios

