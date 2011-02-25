# -*- encoding : utf-8 -*-
class RepresentantesController < InheritedResources::Base
  add_breadcrumb 'Instituições', :instituicoes_path
  add_breadcrumb 'Representantes', :instituicao_representantes_path

  belongs_to :instituicao

  def create
    create!(:notice => "Representante cadastrado com sucesso.") { instituicao_representantes_path }
  end

  def update
    update!(:notice => "Representante atualizado com sucesso.") { instituicao_representantes_path }
  end

end

