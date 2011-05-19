class ItemTramitacao < ActiveRecord::Base
  has_one :convenio

  use_in_brazilian_format :data
end

