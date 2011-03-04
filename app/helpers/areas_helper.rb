module AreasHelper

  def mostrar_arvore_de_areas super_areas
    html_return = ""
    if !super_areas.blank?
      super_areas.each do |area|
        html_return += "<li #{area.last? ? 'class="last"' : 'class="normal"'}>" +
        "<p #{area.last? ? 'class="last"' : 'class="normal"'}>" +
        "<span class=\"checkbox\">#{(check_box_tag "instituicao[area_ids][]", area.id, (@instituicao.id != nil and area.instituicoes.include?(@instituicao)) ? true : false ) if @instituicao}</span>" +
        "<span class=\"name\">#{area.nome}</span>" +
        "<span class=\"actions\">#{actions('area', area)} #{link_to('novo', new_sub_area_path(area.id))}</span></p>" +
        mostrar_arvore_de_areas(Area.where("father_id = ?", area.id).order('nome')) + "</li>"
      end
    end

    return html_return.blank? ? "" : "<ul class=\"tree\">" + html_return + "</ul>"
  end

  def mostrar_arvore_de_areas_instituicao super_areas
    html_return = ""
    if !super_areas.blank?
      super_areas.each do |area|
        if area.father_id.blank?
          html_return += "<li class=\"super_area\" >"
        else
          html_return += "<li class=\"sub_area_de_#{area.father_id}\" >"
        end
        html_return += "<img src=\"/images/back-end/arrow_right.png\" href=\"#\" onclick=\"esconderSubAreas('sub_areas_de_#{area.id}', this)\">"
        html_return += "#{(check_box_tag "instituicao[area_ids][]", area.id, (@instituicao.id != nil and area.instituicoes.include?(@instituicao)) ? true : false, { :onclick => "marcarInputsNaTag('sub_areas_de_#{area.id}', this)", :id => "area_#{area.id}", :class => "#{area.father_id.blank? ? "super_area" : "sub_area_de_#{area.father_id}"}" } ) if @instituicao}"
        html_return += area.nome
        html_return += mostrar_arvore_de_areas_instituicao(Area.where("father_id = ?", area.id).order('nome'))
        html_return += "</li>"
      end
    end

    if super_areas.first
      if super_areas.first.father_id.blank?
        options = "class=\"arvore_de_areas\""
      else
        options = "id=\"" + "sub_areas_de_#{super_areas.first.father_id}\"" + "style=\"display: none;\""
      end
    end

    return html_return.blank? ? "" : "<ul #{options}>" + html_return + "</ul>"
  end

end

