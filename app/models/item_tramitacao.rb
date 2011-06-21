class ItemTramitacao < ActiveRecord::Base
  belongs_to :convenio

  use_in_brazilian_format :data

  validates_presence_of :origem_do_contato, :data, :forma_de_contato, :descricao
end

