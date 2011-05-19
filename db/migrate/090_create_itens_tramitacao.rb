class CreateItensTramitacao < ActiveRecord::Migration
  def self.up
    create_table :item_tramitacaos do |t|
      t.refences :convenio

      t.date :data
      t.string :origem_do_contato
      t.string :forma_de_contato
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :item_tramitacaos
  end
end

