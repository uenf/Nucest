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
    E eu preencho "Tempo de curso" com "8"
    E eu escolho "Período"
    E eu preencho "Tempo de curso" com "8"
    E eu escolho "Trancada" em "Situação da matrícula"
    E eu preencho "Nome" com "<Nome>"
    E eu preencho "Data de nascimento" com "27/03/1990"
    E eu preencho "CPF" com "<CPF>"
    E eu preencho "RG" com "12345678-9"
    E eu preencho "Órgão expedidor" com "Detran"
    E eu preencho "Data de expedição" com "21/01/2004"
    E eu preencho "Nacionalidade" com "Brasileiro"
    E eu preencho "Naturalidade" com "Rio de Janeiro"
    E eu preencho "Sexo" com "Masculino"
    E eu preencho "Filiação" com "Fulano de tal tal"
    E eu escolho "Casado" em "Estado civil"
    E eu preencho "Nome do cônjuge" com "Fulana de tal"
    E eu preencho "Certificado de reservista" com "64416121548231"
    E eu preencho "Título" com "465456456318"
    E eu preencho "CEP" com "28000-200"
    E eu escolho "Rio de Janeiro" em "Estado"
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
    | Algum Nome | 131.572.887-76 | email@estagiário.com | Estagiágio cadastrado com sucesso.    | 1 |
    |            | 131.572.887-76 | email@estagiário.com | não pode ser vazio.                   | 0 |
    | Algum Nome | 000.000.000-00 | email@estagiário.com | numero invalido                       | 0 |
    | Algum Nome | 131.572.887-76 | email.com            | não é válido.                         | 0 |


  @javascript
  Cenário: Excluir um estagiário
    Dado que eu estou logado
    E que eu tenho um estagiário
    E que eu estou na página de estagiários
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 estagiários

