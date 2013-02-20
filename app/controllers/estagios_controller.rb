# -*- encoding : utf-8 -*-

class EstagiosController < InheritedResources::Base
  add_breadcrumb 'Estágios', :estagios_path
  respond_to :js, :only => :index

  def index
    if params[:search].blank?
      params[:search] = { :meta_sort => 'nome.asc' }
    end
    @search = Estagio.search(params[:q])
    @estagios = @search.result
    @estagios = @estagios.page(params[:page]).per(10)
    index!
  end

  def new
    params[:formulario] ||= :uenf_externo
    @instituicoes = Instituicao.all
    new!
  end

  def edit
    @instituicoes = Instituicao.all
    edit!
  end

  def create
    create!(:notice => 'Estágio cadastrado com sucesso.') { redirect_to_on_success }
  end

  def update
    update!(:notice => 'Estágio atualizado com sucesso.') { redirect_to_on_success }
  end

  def redirect_to_on_success
    @instituicoes = Instituicao.all
    if @estagio.save
      if params[:salvar]
        estagios_path
      elsif params[:salvar_editar]
        edit_estagio_path(@estagio.id)
      elsif params[:salvar_cadastrar_estagio]
        new_estagio_path
      end
    end
  end

end

