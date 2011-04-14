# -*- encoding : utf-8 -*-
class EstagiariosController < InheritedResources::Base
  add_breadcrumb 'Estagiários', :estagiarios_path
  respond_to :js, :only => :index

  def index
    if params[:search].blank?
      params[:search] = { :meta_sort => "nome.asc" }
    end
    @search = Estagiario.search(params[:search])
    @estagiarios = @search.all.paginate(:per_page => 20, :page => params[:page])
    index!
  end

  def create
    create!(:notice => "Estagiário cadastrado com sucesso.") { redirect_to_on_success }
  end

  def update
    update!(:notice => "Estagiário atualizado com sucesso.") { redirect_to_on_success }
  end

  def redirect_to_on_success
    if @estagiario.save
      if params[:salvar]
        estagiarios_path
      elsif params[:salvar_editar]
        edit_estagiario_path(@estagiario.id)
      elsif params[:salvar_cadastrar_estagiario]
        new_estagiario_path
      end
    end
  end

end

