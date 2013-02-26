class AddFiliadaAToInstituicao < ActiveRecord::Migration
  def self.up
    add_column :instituicoes, :filiada_a_id, :string
  end

  def self.down
    remove_column :instituicoes, :filiada_a_id, :string
  end
end

