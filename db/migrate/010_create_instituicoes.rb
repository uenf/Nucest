# -*- encoding : utf-8 -*-
class CreateInstituicoes < ActiveRecord::Migration
  def self.up
    create_table :instituicoes do |t|
      t.string :nome
      t.string :origem
      t.string :pais
      t.string :registro_local
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

      t.timestamps
    end
  end

  def self.down
    drop_table :instituicoes
  end
end

