# -*- encoding : utf-8 -*-
class AreasController < InheritedResources::Base
  add_breadcrumb 'Áreas de estágio', :areas_path

  def index
    index!{ @super_areas = Area.where("father_id IS NULL").order('nome') }
  end

end

