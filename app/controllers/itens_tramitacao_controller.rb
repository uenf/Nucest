class ItensTramitacaoController < ApplicationController
  respond_to :js, :only => [:index]

  def index
    @item_tramitacao = ItemTramitacao.new(:convenio_id => params[:convenio_id])
    @itens_tramitacao = ItemTramitacao.where("convenio_id = ?", params[:convenio_id]).order("data DESC, created_at DESC")
  end

  def create
    @item_tramitacao = ItemTramitacao.new(params[:item_tramitacao])
    if @item_tramitacao.save
      redirect_to :action => 'index', :format => :js, :convenio_id => @item_tramitacao.convenio_id, :errors => @item_tramitacao.errors
    else
      render :action => 'index', :format => :js, :convenio_id => @item_tramitacao.convenio_id, :itens_tramitacao => @itens_tramitacao
    end
  end

  def destroy
    @item_tramitacao = ItemTramitacao.find(params[:id])
    redirect_to :action => 'index', :format => :js, :convenio_id => @item_tramitacao.convenio_id
    @item_tramitacao.destroy
  end
end

