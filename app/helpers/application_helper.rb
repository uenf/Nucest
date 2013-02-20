# -*- encoding : utf-8 -*-
module ApplicationHelper

  ESTADOS = ['Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará',
                'Distrito Federal', 'Espírito Santo', 'Goiás', 'Maranhão',
                'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Paraná',
                'Paraíba', 'Pará', 'Pernambuco', 'Piauí', 'Rio de Janeiro',
                'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima',
                'Santa Catarina', 'Sergipe', 'São Paulo', 'Tocantins']

  SIGLAS_ESTADOS = {'Acre' => 'AC', 'Alagoas' => 'AL', 'Amapá' => 'AP', 'Amazonas' => 'AM',
                       'Bahia' => 'BA', 'Ceará' => 'CE', 'Distrito Federal' => 'DF',
                       'Espírito Santo' => 'ES', 'Goiás' => 'GO', 'Maranhão' => 'MA',
                       'Mato Grosso' => 'MT', 'Mato Grosso do Sul' => 'MS',
                       'Minas Gerais' => 'MG', 'Paraná' => 'PR', 'Paraíba' => 'PB',
                       'Pará' => 'PA', 'Pernambuco' => 'PE', 'Piauí' => 'PI',
                       'Rio de Janeiro' => 'RJ', 'Rio Grande do Norte' => 'RN',
                       'Rio Grande do Sul' => 'RS', 'Rondônia' => 'RO', 'Roraima' => 'RR',
                       'Santa Catarina' => 'SC', 'Sergipe' => 'SE', 'São Paulo' => 'SP', 'Tocantins' => 'TO'}

  ESTADOS_CIVIS = [ 'Solteiro', 'Casado', 'Separado', 'Divorciado', 'Viúvo' ]

  ESCOLARIDADE = [ 'Fundamental incompleto', 'Fundamental completo', 'Médio incompleto',
                     'Médio completo', 'Superior incompleto', 'Superior completo' ]

  def t conteudo
    conteudo.nil? ? '' : conteudo.html_safe
  end

  def li_link_to (nome, path, options = { :last_path => false, :current_path => request.path })
    html_class = options[:class].nil? ? '' : " class=\"#{options[:class]}\""

    if options[:last_path] == true
      if options[:current_path] == path
        return '<li class="active">' + link_to(nome, path) + '</li>'
      end
    else
      if breadcrumbs and breadcrumbs.include?(path) || options[:current_path] == path
        return '<li class="active">' + link_to(nome, path) + '</li>'
      end
    end

    return "<li#{html_class}>" + link_to(nome, path) + '</li>'
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
	       dayNamesMin: ['Seg','Ter','Qua','Qui','Sex','Sab','Dom'],
	       showOn: 'button',
		     buttonImage: '/assets/back-end/calendar.png',
		     buttonImageOnly: true,
		     buttonText: 'Selecione uma data'
        });
      });
    </script>".html_safe
  end

  def siglas_dos_estados
    return SIGLAS_ESTADOS
  end

  def estados_brasileiros
    return ESTADOS
  end

  def flash_messages
    html = ''
    flash.each do |name, msg|
      html += content_tag(:li, msg, :class => name).html_safe if msg.is_a?(String)
    end
    return html.html_safe
  end
end

