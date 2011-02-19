# -*- encoding : utf-8 -*-
class RepresentantesController < InheritedResources::Base
  before_filter :add_initial_breadcrumbs

  belongs_to :instituicao

  def create
    create!(:notice => "Representante cadastrado com sucesso.") { instituicao_representantes_url }
  end

  def update
    update!(:notice => "Representante atualizado com sucesso.") { instituicao_representantes_url }
  end

  private

  def add_initial_breadcrumbs
    breadcrumbs.add 'Instituições', instituicoes_path
    breadcrumbs.add 'Representantes', instituicao_representantes_url
  end
end

