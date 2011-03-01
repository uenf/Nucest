module AreasHelper

  def mostrar_arvore_de_areas super_areas
    html_return = ""
    tab = ""

    super_areas.each do |area|
      tab += "  "
      html_return += "<li #{area.last? ? 'class="last"' : 'class="normal"'}>" +
      "<p #{area.last? ? 'class="last"' : 'class="normal"'}><span class=\"name\">#{area.nome}</span>" +
      "<span class=\"actions\">#{actions('area', area)}</span></p>" +
      mostrar_arvore_de_areas(Area.where("father_id = ?", area.id).order('nome')) + "</li>"
    end

    return html_return.blank? ? "" : "<ul class=\"tree\">" + html_return + "</ul>"
  end

end

