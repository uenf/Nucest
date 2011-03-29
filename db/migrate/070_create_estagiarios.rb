# -*- encoding : utf-8 -*-
class CreateEstagiarios < ActiveRecord::Migration
  def self.up
    create_table :estagiarios do |t|
      ### Dados acadêmicos ###
      t.string :matricula
      t.string :matricula_grh
      t.string :curso
      t.string :tempo_de_curso
      t.string :formato_do_tempo_de_curso
      t.string :situacao_da_matricula
      t.string :escolaridade
      ### Dados pessoais ###
      t.string :nome
      t.date :data_de_nascimento
      t.string :cpf
      t.string :rg
      t.string :orgao_expedidor
      t.date :data_de_expedicao
      t.string :nacionalidade
      t.string :naturalidade
      t.string :sexo
      t.string :filiacao
      t.string :estado_civil
      t.string :nome_do_conjuge
      t.string :certificado_de_reservista
      t.string :titulo_de_eleitor
      ### Endereço ###
      t.string :cep
      t.string :estado
      t.string :cidade
      t.string :bairro
      t.string :rua
      t.string :numero
      t.string :complemento
      ### Contato ###
      t.string :telefone
      t.string :celular
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :estagiarios
  end
end

