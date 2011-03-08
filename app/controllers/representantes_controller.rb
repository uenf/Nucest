# -*- encoding : utf-8 -*-
class RepresentantesController < InheritedResources::Base
  before_filter :breadcrumbs
  belongs_to :instituicao

  def create
    create!(:notice => "Representante cadastrado com sucesso.") { instituicao_representantes_path }
  end

  def update
    update!(:notice => "Representante atualizado com sucesso.") { instituicao_representantes_path }
  end

  def breadcrumbs
    add_breadcrumb 'Instituições', :instituicoes_path
    add_breadcrumb Instituicao.find(params[:instituicao_id]).nome, instituicao_path(params[:instituicao_id])
    add_breadcrumb 'Representantes', :instituicao_representantes_path
  end

end

