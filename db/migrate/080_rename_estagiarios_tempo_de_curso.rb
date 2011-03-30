class MyNewMigration < ActiveRecord::Migration
  def self.up
    rename_column :estagiarios, :tempo_de_curso, :tempo_em_curso
    rename_column :estagiarios, :formato_do_tempo_de_curso, :formato_tempo_em_curso
  end

  def self.down
  end
end

