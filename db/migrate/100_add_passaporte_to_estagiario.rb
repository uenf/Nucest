class AddPassaporteToEstagiario < ActiveRecord::Migration
  def self.up
    add_column :estagiarios, :passaporte, :string
  end

  def self.down
    remove_column :estagiarios, :passaporte, :string
  end
end

