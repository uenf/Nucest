# -*- encoding : utf-8 -*-
class CreateInstituicoes < ActiveRecord::Migration
  def self.up
    create_table :instituicoes do |t|
      t.string :nome
      t.string :cnpj
      t.string :sigla
      t.integer :tipo
      t.string :razao_social
      t.integer :tipo_de_convenio
      t.string :cep
      t.string :estado
      t.string :cidade
      t.string :bairro
      t.string :rua
      t.integer :numero
      t.string :complemento
      t.string :telefone
      t.string :celular
      t.string :fax
      t.string :caixa_postal
      t.string :email
      t.string :site
      t.date :inicio_do_convenio
      t.date :fim_do_convenio
#      t.string :nome_representante
#      t.string :funcao_representante
#      t.string :rg_representante
#      t.string :orgao_expedidor_representante
#      t.string :cpf_representante
#      t.string :telefone_representante
#      t.string :celular_representante
#      t.string :email_representante
#      t.string :nome_contato
#      t.string :telefone_contato
#      t.string :celular_contato
#      t.string :email_contato
#      t.string :nome_supervisor
#      t.string :matricula_supervisor
#      t.string :lotacao_supervisor
#      t.string :funcao_supervisor
#      t.string :telefone_supervisor

      t.timestamps
    end
  end

  def self.down
    drop_table :instituicoes
  end
end

