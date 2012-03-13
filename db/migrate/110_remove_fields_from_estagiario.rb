class RemoveFieldsFromEstagiario < ActiveRecord::Migration
  def self.up
      remove_column :estagiarios, :instituicao_id
      remove_column :estagiarios, :matricula
      remove_column :estagiarios, :curso
      remove_column :estagiarios, :tempo_em_curso
      remove_column :estagiarios, :formato_tempo_em_curso
      remove_column :estagiarios, :situacao_da_matricula
      remove_column :estagiarios, :escolaridade
  end
end

