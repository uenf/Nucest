# -*- encoding : utf-8 -*-
module ApplicationHelper

  def t conteudo
    conteudo.nil? ? '' : conteudo.html_safe
  end

  def li_link_to (nome, path)
    if breadcrumbs and breadcrumbs.include?(path) || request.env['PATH_INFO']  == path
      return '<li class="active">' + link_to(nome, path) + '</li>'
    else
      return '<li>' + link_to(nome, path) + '</li>'
    end
  end

  def datepicker_header
    return "#{javascript_include_tag 'datepicker.js'}
    #{javascript_include_tag 'jquery-ui.js'}
    #{stylesheet_link_tag 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/base/jquery-ui.css'}
    #{stylesheet_link_tag 'http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css'}".html_safe
  end

  def datepicker id, *opts
    "<script type=\"text/javascript\">
      $(function() {
        $('\##{id}').datepicker({
         #{unless opts.blank?
            opts.join(',') + ','
          end}
	        numberOfMonths: 2,
	        showButtonPanel: true,
	        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho',
	                    'Agosto','Setembro','Outubro','Novembro','Dezembro'],
	       currentText: 'Hoje',
	       closeText: 'Fechar',
	       dateFormat: 'dd/mm/yy',
	       dayNamesMin: ['Seg','Ter','Qua','Qui','Sex','Sab','Dom']
        });
      });
    </script>".html_safe
  end

end

