# -*- encoding : utf-8 -*-

class CreateConvenios < ActiveRecord::Migration
  def self.up
    create_table :convenios do |t|
      t.string :numero
      t.integer :tipo
      t.integer :situacao, :default => Convenio::SITUACAO['Em tramitação']
      t.date :inicio
      t.date :fim
      t.references :instituicao

      t.timestamps
    end
  end

  def self.down
    drop_table :convenios
  end
end

