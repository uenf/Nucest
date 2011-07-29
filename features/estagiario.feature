#language: pt

Funcionalidade: Manipular estagiário
  Como um usuário
  Eu quero manipular os estagiários
  Para que eu possa usar suas informações no cadastro de estágio

  Esquema do Cenário: Cadastrar um estagiário
    Dado que eu estou logado
    E que eu estou na página de cadastro de estagiários
    Quando eu preencho "Matrícula" com "12345"
    E eu preencho "Matrícula GRH" com "54321"
    E eu preencho "Curso" com "CCI"
    E eu seleciono "8º" em "Tempo em curso"
    E eu seleciono "Período" em "estagiario_formato_tempo_em_curso"
    E eu seleciono "Em curso" em "Situação da matrícula"
    E eu preencho "Nome" com "<Nome>"
    E eu preencho "Data de nascimento" com "27/03/1990"
    E eu preencho "CPF" com "<CPF>"
    E eu preencho "RG" com "12345678-9"
    E eu preencho "Órgão expedidor" com "Detran"
    E eu preencho "Data de expedição" com "21/01/2004"
    E eu preencho "Nacionalidade" com "Brasileiro"
    E eu preencho "Naturalidade" com "Rio de Janeiro"
    E eu seleciono "Masculino" em "Sexo"
    E eu preencho "Filiação" com "Fulano de tal tal"
    E eu seleciono "Casado" em "Estado civil"
    E eu preencho "Nome do cônjuge" com "Fulana de tal"
    E eu preencho "Certificado de reservista" com "64416121548231"
    E eu preencho "Título" com "465456456318"
    E eu preencho "CEP" com "28000-200"
    E eu seleciono "Rio de Janeiro" em "Estado"
    E eu preencho "Cidade" com "Campos"
    E eu preencho "Bairro" com "Centro"
    E eu preencho "Rua" com "Alberto Lamego"
    E eu preencho "Número" com "123"
    E eu preencho "Complemento" com "ap 1"
    E eu preencho "Telefone" com "2222222222"
    E eu preencho "Celular" com "2222222222"
    E eu preencho "E-mail" com "<E-mail>"
    E eu pressiono "Salvar"
    Então eu devo ver "<Mensagem>"
    E eu devo ter <N> estagiários

  Exemplos:
    | Nome       | CPF            | E-mail               | Mensagem                              | N |
    | Algum Nome | 131.572.887-76 | email@estagiario.com | Estagiário cadastrado com sucesso.    | 1 |
    |            | 131.572.887-76 | email@estagiario.com | não pode ser vazio.                   | 0 |
    | Algum Nome | 000.000.000-00 | email@estagiario.com | número inválido                       | 0 |
    | Algum Nome | 131.572.887-76 | email.com            | não é válido.                         | 0 |


  Cenário: Cadastrar um estagiário com CPF já registrado
    Dado que eu estou logado
    E que eu tenho um estagiário com CPF "13157288776"
    E que eu estou na página de cadastro de estagiários
    E eu preencho "Nome" com "Fulano"
    E eu preencho "CPF" com "13157288776"
    E eu pressiono "Salvar"
    Então eu devo ver "já está em uso."
    E eu devo ter 1 estagiário

  @javascript
  Cenário: Excluir um estagiário
    Dado que eu estou logado
    E que eu tenho um estagiário
    E que eu estou na página de estagiários
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 estagiários

  @javascript
  Cenário: Buscar e ordenar a lista de estagiários
    Dado que eu estou logado
    E que eu tenho um estagiário com nome "Teste a1"
    E que eu tenho um estagiário com nome "Teste a2"
    E que eu tenho um estagiário com nome "Teste b1"
    E que eu estou na página de estagiários
    Quando eu preencho "search_nome_or_matricula_or_cpf_contains" com "Teste"
    Então eu devo ver a tabela com:
      | Nome ▲      |
      | Teste a1 |
      | Teste a2 |
      | Teste b1 |
    Quando eu preencho "search_nome_or_matricula_or_cpf_contains" com "Teste a"
    E eu espero 1 segundo
    Então eu devo ver a tabela com:
      | Nome ▲      |
      | Teste a1 |
      | Teste a2 |
    Quando eu clico em "Nome"
    E eu espero 1 segundo
    Então eu devo ver a tabela com:
      | Nome ▼      |
      | Teste a2 |
      | Teste a1 |

