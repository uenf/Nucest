# -*- encoding : utf-8 -*-
class InstituicoesController < InheritedResources::Base
  add_breadcrumb 'Instituições', :instituicoes_path
  respond_to :js, :only => :index

  def index
    if params[:search].blank?
      params[:search] = { :meta_sort => "nome.asc" }
    end
    @search = Instituicao.search(params[:search])
    @instituicoes = @search.all.paginate(:per_page => 20, :page => params[:page])
    index!
  end

  def create
    create!(:notice => "Instituição cadastrada com sucesso.") { redirect_to_on_success }
  end

  def update
    @instituicao = Instituicao.find(params[:id])
    @instituicao.area_ids = [] if params[:instituicao].nil?
    update!(:notice => "Instituição atualizada com sucesso.") { redirect_to_on_success }
  end

  def areas
    @instituicao = Instituicao.find(params[:id])
    add_breadcrumb @instituicao.nome, :instituicao_url
    add_breadcrumb 'Cadastrar áreas da instituição', :areas_instituicao_url
    @super_areas = Area.where("father_id IS NULL").order('nome')
  end

  def redirect_to_on_success
    if @instituicao.save
      if params[:salvar]
        instituicoes_path
      elsif params[:salvar_cadastrar_instituicao]
        new_instituicao_path
      elsif params[:salvar_cadastrar_convenio]
        new_instituicao_convenio_path(@instituicao.id)
      elsif params[:salvar_cadastrar_representante]
        new_instituicao_representante_path(@instituicao.id)
      elsif params[:salvar_cadastrar_supervisor]
        new_instituicao_supervisor_path(@instituicao.id)
      end
    end
  end

end

