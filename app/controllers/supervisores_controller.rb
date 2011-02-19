# -*- encoding : utf-8 -*-
class SupervisoresController < InheritedResources::Base
  before_filter :add_initial_breadcrumbs

  belongs_to :instituicao

  def create
    create!(:notice => "Supervisor cadastrado com sucesso.") { instituicao_supervisores_url }
  end

  def update
    update!(:notice => "Supervisor atualizado com sucesso.") { instituicao_supervisores_url }
  end

  private

  def add_initial_breadcrumbs
    breadcrumbs.add 'Instituições', instituicoes_path
    breadcrumbs.add 'Supervisores', instituicao_supervisores_url
  end
end

