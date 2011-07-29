# -*- encoding : utf-8 -*-
class RepresentantesController < InheritedResources::Base
  before_filter :breadcrumbs
  belongs_to :instituicao

  def create
    create!(:notice => "Representante cadastrado com sucesso.") { redirect_to_on_success }
  end

  def update
    update!(:notice => "Representante atualizado com sucesso.") { redirect_to_on_success }
  end

  def redirect_to_on_success
    if @representante.save
      if params[:salvar]
        instituicao_representantes_path
      elsif params[:salvar_cadastrar_convenio]
        instituicao_convenios_path
      elsif params[:salvar_cadastrar_representante]
        new_instituicao_representante_path(@instituicao.id)
      elsif params[:salvar_cadastrar_supervisor]
        new_instituicao_supervisor_path(@instituicao.id)
      end
    end
  end

  def breadcrumbs
    add_breadcrumb 'Instituições', :instituicoes_path
    add_breadcrumb Instituicao.find(params[:instituicao_id]).nome, edit_instituicao_path(params[:instituicao_id])
    add_breadcrumb 'Representantes', :instituicao_representantes_path
  end

end

