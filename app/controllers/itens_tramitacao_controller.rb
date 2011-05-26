class ItensTramitacaoController < ApplicationController
  respond_to :js, :only => [:index]

  def index
    @item_tramitacao = ItemTramitacao.new
    @itens_tramitacao = ItemTramitacao.where("convenio_id = ?", params[:convenio_id]).order("data DESC, created_at DESC")
  end

  def create
    @item_tramitacao = ItemTramitacao.new(params[:item_tramitacao])
    redirect_to :action => 'index', :format => :js, :convenio_id => @item_tramitacao.convenio_id
    @item_tramitacao.save
  end

  def destroy
    @item_tramitacao = ItemTramitacao.find(params[:id])
    redirect_to :action => 'index', :format => :js, :convenio_id => @item_tramitacao.convenio_id
    @item_tramitacao.destroy
  end
end

