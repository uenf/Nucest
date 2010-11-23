# -*- encoding : utf-8 -*-
class CreateInstituicoes < ActiveRecord::Migration
  def self.up
    create_table :instituicoes do |t|
      t.string :nome
      t.string :cnpj
      t.string :sigla
      t.string :tipo
      t.string :razao_social
      t.string :tipo_de_convenio
      t.string :cep
      t.string :estado
      t.string :cidade
      t.string :bairro
      t.string :rua
      t.string :numero
      t.string :complemento
      t.string :telefone
      t.string :celular
      t.string :fax
      t.string :caixa_postal
      t.string :email
      t.string :site
      t.string :inicio_do_periodo_oferecido
      t.string :fim_do_periodo_oferecido

      t.timestamps
    end
  end

  def self.down
    drop_table :instituicoes
  end
end

