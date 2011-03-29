# -*- encoding : utf-8 -*-
class EstagiariosController < InheritedResources::Base
  add_breadcrumb 'Estagiários', :estagiarios_path

  def create
    create!(:notice => "Estagiário cadastrado com sucesso.") { estagiarios_path }
  end

  def update
    update!(:notice => "Estagiário atualizado com sucesso.") { estagiarios_path }
  end

end

