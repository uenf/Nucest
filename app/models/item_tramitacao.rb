class ItemTramitacao < ActiveRecord::Base
  belongs_to :convenio

  flexible_date :data, :suffix => 'br'

  validates_presence_of :origem_do_contato, :data_br, :forma_de_contato, :descricao
end

