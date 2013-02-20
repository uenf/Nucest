# -*- encoding : utf-8 -*-

class CreateEstagios < ActiveRecord::Migration
  def self.up
    create_table :estagios do |t|
      t.text :atividades
      t.text :outras_ajudas_de_custo
      t.date :data_inicial
      t.date :data_final
      t.boolean :remunerado
      t.string :estagio_supervisionado
      t.string :carga_horaria_semanal
      t.string :carga_horaria_total
      t.string :valor_da_bolsa
      t.string :setor
      t.string :subsetor
      t.string :curso
      t.string :matricula
      t.string :periodo
      t.string :carga_horaria_total_necessaria
      t.string :local_estagio_uenf
      t.string :departamento
      t.string :polo
      t.string :diretor
      t.string :disponibilidade
      t.boolean :obrigatorio
      t.integer :grau_ensino
      t.integer :termo


      t.references :instituicao_destino
      t.references :supervisor
      t.references :instituicao_origem
      t.references :estagiario
      t.references :agente_integracao

      t.timestamps
    end
  end

  def self.down
    drop_table :estagios
  end
end

