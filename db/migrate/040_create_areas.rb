# -*- encoding : utf-8 -*-
class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :nome
      t.integer :father_id

      t.timestamps
    end
  end

  def self.down
    drop_table :areas
  end
end

