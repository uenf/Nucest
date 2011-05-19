# -*- encoding: utf-8 -*-

class AreasController < InheritedResources::Base
  add_breadcrumb 'Áreas de estágio', :areas_path

  def index
    index!{ @super_areas = Area.where("father_id IS NULL").order('nome') }
  end

  def create
    create!(:notice => "Área cadastrada com sucesso.") { areas_path }
  end

  def update
    update!(:notice => "Área atualizada com sucesso.") { areas_path }
  end


end

