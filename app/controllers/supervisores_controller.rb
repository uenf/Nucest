# -*- encoding : utf-8 -*-
class SupervisoresController < InheritedResources::Base
  before_filter :breadcrumbs
  belongs_to :instituicao

  def create
    create!(:notice => "Supervisor cadastrado com sucesso.") { instituicao_supervisores_path }
  end

  def update
    update!(:notice => "Supervisor atualizado com sucesso.") { instituicao_supervisores_path }
  end

  def breadcrumbs
    add_breadcrumb 'Instituições', :instituicoes_path
    add_breadcrumb Instituicao.find(params[:instituicao_id]).nome, instituicao_path(params[:instituicao_id])
    add_breadcrumb 'Supervisores', :instituicao_supervisores_path
  end

end

