class ItensTramitacaoController < InheritedResources::Base
    actions :all, :except => [ :new, :edit, :show ]
    respond_to :js

    def index
      @item_tramitacao = ItemTramitacao.new
      @itens_tramitacao = ItemTramitacao.where("convenio_id = ?", params[:convenio_id]).order("data DESC")
      index!
    end

    def create
      @item_tramitacao = ItemTramitacao.new(params[:item_tramitacao])
      render :nothing => true
      @item_tramitacao.save
    end
end

