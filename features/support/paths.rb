# -*- encoding : utf-8 -*-
module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /na página inicial/
        '/'

    ### Instituição ###
    when /página de cadastro de instituições/
      new_instituicao_path

    when /página de instituições/
      instituicoes_path

    when /página da instituição/
      instituicao_path(@instituicao)

    when /página de edição da instituição/
      edit_instituicao_path(@instituicao)

    ### Representante ###
    when /página de cadastro de representantes/
      new_instituicao_representante_path(@instituicao)

    when /página de representantes da instituição/
      instituicao_representantes_path(@instituicao)

    ### Supervisor ###
    when /página de cadastro de supervisores/
      new_instituicao_supervisor_path(@instituicao)

    when /página de supervisores da instituição/
      instituicao_supervisores_path(@instituicao)

    ### Áreas ###
    when /página de cadastro de áreas/
      new_area_path

    when /página de cadastro de sub-área/
      new_sub_area_path(@area)

    when /página da área/
      edit_area_path(@area)

    ### Estagiário ###
    when /página de cadastro de estagiários/
      new_estagiario_path

    when /página de estagiários/
      estagiarios_path

    ### Usuário ###
    when /página de login/
      new_usuario_session_path

    ### Convênio ###
    when /página de cadastro de convênios/
      new_instituicao_convenio_path(@instituicao)

    when /página de convênios da instituição/
      instituicao_convenios_path(@instituicao)

    when /página de cadastro dos dados do convênio/
      finalizar_tramitacao_path(@instituicao, @convenio)

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

