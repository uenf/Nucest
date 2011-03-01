class AreasController < InheritedResources::Base

  def index
    index!{ @super_areas = Area.where("father_id IS NULL").order('nome') }
  end

end

