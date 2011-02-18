class CreateSupervisores < ActiveRecord::Migration
  def self.up
    create_table :supervisores do |t|
      t.string :nome
      t.string :lotacao
      t.string :matricula
      t.string :funcao
      t.string :telefone
      t.string :celular
      t.string :email
      t.references :instituicao

      t.timestamps
    end
  end

  def self.down
    drop_table :supervisores
  end
end

