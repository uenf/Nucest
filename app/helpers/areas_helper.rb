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
        html_return += "<li>"
        html_return += "#{(check_box_tag "instituicao[area_ids][]", area.id, (@instituicao.id != nil and area.instituicoes.include?(@instituicao)) ? true : false ) if @instituicao}"
        html_return += area.nome
        html_return += mostrar_arvore_de_areas_instituicao(Area.where("father_id = ?", area.id).order('nome'))
        html_return += "</li>"
      end
    end

    if super_areas.first
      if super_areas.first.father_id.blank?
        tag = "class=\"arvore_de_areas\""
      else
        tag = "id=\"" + "#{super_areas.first.father_id}\""
      end
    end

    return html_return.blank? ? "" : "<ul #{tag}>" + html_return + "</ul>"
  end

end

