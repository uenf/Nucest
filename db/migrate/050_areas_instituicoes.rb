# -*- encoding : utf-8 -*-
class AreasInstituicoes < ActiveRecord::Migration
  def self.up
    create_table :areas_instituicoes, :id => false do |t|
      t.references :area, :instituicao
    end
  end

  def self.down
    drop_table :atividades_palestrantes
  end
end

