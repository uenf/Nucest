#language: pt

Funcionalidade: Manipular area
  Como um usuário
  Eu quero manipular as áreas
  Para que eu possa usar associá-las às instituições

  Cenário: Cadastrar uma área com sucesso
    Dado que eu estou logado
    E que eu estou na página de cadastro de áreas
    Quando eu preencho "Nome" com "Nome da área"
    E eu pressiono "Salvar"
    Então eu devo ver "Área cadastrada com sucesso."
    E eu devo ter 1 área

  Cenário: Cadastrar uma sub-área com sucesso
    Dado que eu estou logado
    E que eu tenho uma área
    E que eu estou na página de cadastro de sub-área
    Quando eu preencho "Nome" com "Nome da sub-área"
    E eu pressiono "Salvar"
    Então eu devo ver "Área cadastrada com sucesso."
    E eu devo ter 2 áreas
    E a sub-área deve estar ligada à área

  Cenário: Cadastrar uma área sem sucesso
    Dado que eu estou logado
    E que eu estou na página de cadastro de áreas
    Quando eu não preencho "Nome"
    E eu pressiono "Salvar"
    Então eu devo ver "não pode ser vazio."
    E eu devo ter 0 áreas

  @javascript
  Cenário: Excluir uma área
    Dado que eu estou logado
    E que eu tenho uma área
    E que eu estou na página da área
    E eu clico em "Excluir" e pressiono "OK" no popup
    Então eu devo ter 0 áreas

