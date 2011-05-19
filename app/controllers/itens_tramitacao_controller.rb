class ItensTramitacaoController < InheritedResources::Base
    actions :all, :except => [ :new, :edit, :show ]
end

