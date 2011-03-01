# -*- encoding : utf-8 -*-
class SupervisoresController < InheritedResources::Base
  add_breadcrumb 'Instituições', :instituicoes_path
  add_breadcrumb 'Supervisores', :instituicao_supervisores_path

  belongs_to :instituicao

  def create
    create!(:notice => "Supervisor cadastrado com sucesso.") { instituicao_supervisores_path }
  end

  def update
    update!(:notice => "Supervisor atualizado com sucesso.") { instituicao_supervisores_path }
  end

end

