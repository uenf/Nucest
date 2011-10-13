# -*- encoding : utf-8 -*-
module AreasHelper

  def lista_de_areas(hash, instituicao=nil)
    html = ""
    hash.each_pair do |key, value|

      unless value.nil?
        sub_areas = lista_de_areas(value, instituicao)
      end

      html += "<li class=\"#{sub_areas.blank? ? 'empty' : 'hide'}\" data-id=\"#{key.id}\">" + item_da_lista_de_areas(key, instituicao) + sub_areas + '</li>'
    end

    return html.blank? ? "" : ("<ul>" + html + "</ul>").html_safe
  end

  def item_da_lista_de_areas(area, instituicao)
    show_sub_areas = '<a class="show_sub"><span>Sub-areas</span></a>'
    checked = "checked=\"checked\"" if area.instituicoes.include?(instituicao)
    checkbox = "<input type=\"checkbox\" name=\"instituicao[area_ids][]\" value=\"#{area.id}\" #{checked}/>"
    sub_area = link_to 'Nova sub-area', new_sub_area_path(area, :instituicao_id => instituicao.try(:id)),
      :remote => true,
      :class => 'button',
      :onclick => "$('#window_form_area').jqm().jqmShow();"

    edit_button = link_to image_tag('back-end/edit.png', :alt => 'Editar', :title => 'Editar'), edit_area_path(area),
      :remote => true,
      :onclick => "$('#window_form_area').jqm().jqmShow();",
      :class => 'edit'

    delete_button = link_to image_tag('back-end/delete.png', :alt => 'Excluir', :title => 'Excluir'), area_path(area),
      :confirm => 'Esta ação é irreversível. Deseja realmente continuar?',
      :method => :delete,
      :remote => true,
      :class => 'delete'
    return "#{checkbox if not instituicao.nil?} <span class=\"show_action\">#{show_sub_areas} <strong>#{area.nome}</strong> #{sub_area}</span>" +
            "<span class=\"actions\">#{edit_button}#{delete_button}</span>"
  end

end

