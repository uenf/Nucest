class CreateRepresentantes < ActiveRecord::Migration
  def self.up
    create_table :representantes do |t|
      t.string :nome
      t.string :funcao
      t.string :rg
      t.string :orgado_expedidor
      t.string :cpf
      t.string :telefone
      t.string :celular
      t.string :email
      t.references :instituicao

      t.timestamps
    end
  end

  def self.down
    drop_table :representantes
  end
end
