require 'spec_helper'

describe ItemTramitacao do
  should_belong_to :convenio

  should_validate_presence_of :origem_do_contato, :data, :forma_de_contato, :descricao
end

