# -*- encoding : utf-8 -*-

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
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

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

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

