# -*- encoding : utf-8 -*-
module AreasHelper

  def mostrar_arvore_de_areas super_areas
    html_return = ""
    if !super_areas.blank?
      super_areas.each do |area|
        if area.father_id.blank?
          html_return += "<li class=\"super_area\" >"
        else
          html_return += "<li class=\"sub_area_de_#{area.father_id}\" >"
        end
        if area.children.exists?
          html_return += "<img src=\"/images/back-end/arrow_down.png\""
        else
          html_return += "<img src=\"/images/back-end/arrow_right.png\""
        end
        html_return += " href=\"#\" onclick=\"esconderSubAreas('sub_areas_de_#{area.id}', this)\">"
        html_return += "#{link_to(area.nome, area_path(area.id))}"
        html_return += mostrar_arvore_de_areas(Area.where("father_id = ?", area.id).order('nome'))
        html_return += "</li>"
      end
    end
    if super_areas.first
      if super_areas.first.father_id.blank?
        options = "class=\"arvore_de_areas\""
      else
        options = "id=\"" + "sub_areas_de_#{super_areas.first.father_id}\""
      end
    end

    return html_return.blank? ? "" : "<ul #{options} #{display}>" + html_return + "</ul>"
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
        img = "<img src=\"/images/back-end/arrow_right.png\""
        if @instituicao.areas.include?(area)
          area.children.each do |area|
            if area.instituicoes.include?(@instituicao)
              img = "<img src=\"/images/back-end/arrow_down.png\""
            end
          end
        end
        html_return += img
        html_return += " href=\"#\" onclick=\"esconderSubAreas('sub_areas_de_#{area.id}', this)\">"
        html_return += "#{(check_box_tag "instituicao[area_ids][]", area.id, (@instituicao.id != nil and area.instituicoes.include?(@instituicao)) ? true : false, { :onclick => "marcarInputsNaTag('sub_areas_de_#{area.id}', this)", :id => "area_#{area.id}", :class => "#{area.father_id.blank? ? "super_area" : "sub_area_de_#{area.father_id}"}" } ) if @instituicao}"
        html_return += area.nome
        html_return += mostrar_arvore_de_areas_instituicao(Area.where("father_id = ?", area.id).order('nome'))
        html_return += "</li>"
      end
    end

contador = 0

    if super_areas.first
      if super_areas.first.father_id.blank?
        options = "class=\"arvore_de_areas\""
      else
        options = "id=\"" + "sub_areas_de_#{super_areas.first.father_id}\""
          super_areas.each do |area|
            if !area.instituicoes.include?(@instituicao)
              contador = contador + 1
            end
          end

        if contador == super_areas.count
          display = "style=\"display: none;\""
        end
      end
    end

    return html_return.blank? ? "" : "<ul #{options} #{display}>" + html_return + "</ul>"
  end

end

