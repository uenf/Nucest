class AddContatoToInstituicao < ActiveRecord::Migration
  def self.up
    add_column :instituicoes, :contato_nome, :string
    add_column :instituicoes, :contato_email, :string
    add_column :instituicoes, :contato_telefone, :string
    add_column :instituicoes, :contato_celular, :string
  end

  def self.down
    remove_column :instituicoes, :contato_nome, :string
    remove_column :instituicoes, :contato_email, :string
    remove_column :instituicoes, :contato_telefone, :string
    remove_column :instituicoes, :contato_celular, :string
  end
end

