class ItemTramitacao < ActiveRecord::Base
  belongs_to :convenio

  use_in_brazilian_format :data
end

