class ItensTramitacaoController < InheritedResources::Base
    actions :all, :except => [ :new, :edit, :show ]

    def create
      @item_tramitacao = ItemTramitacao.new(params[:item_tramitacao])

      if @item_tramitacao.save
        p params
        redirect_to :controller => 'convenios', :actions => 'index'
      else
      end
    end
end

