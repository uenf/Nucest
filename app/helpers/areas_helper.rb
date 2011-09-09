module AreasHelper

  def lista_de_areas(hash, instituicao=nil)
    html = ""

    hash.each_pair do |key, value|
      sub_areas = lista_de_areas(value, instituicao)

      html += "<li class=\"#{sub_areas.blank? ? 'empty' : 'hide'}\">" + item_da_lista_de_areas(key, instituicao) + sub_areas + '</li>'
    end

    return html.blank? ? "" : ("<ul>" + html + "</ul>").html_safe
  end

  def item_da_lista_de_areas(area, instituicao)
    show_sub_areas = '<a class="show_sub"><span>Sub-areas</span></a>'
    checked = "checked=\"checked\"" if area.instituicoes.include?(instituicao)
    checkbox = "<input type=\"checkbox\" name=\"instituicao[area_ids][]\" value=\"#{area.id}\" #{checked}/>"
    sub_area = link_to 'Nova sub-area', new_sub_area_path(area.id), :class => 'button'
    return "#{checkbox if not instituicao.nil?} <span>#{show_sub_areas} #{area.nome} #{sub_area}</span>"
  end

end

