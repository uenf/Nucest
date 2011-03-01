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

  def actions(object_name, object, options = {})
    edit = "edit_" + object_name + "_path(object)"

    options[:show]   = true if options[:show].nil?
    options[:edit]   = true if options[:edit].nil?
    options[:delete] = true if options[:delete].nil?

    string_return =  link_to('Show', object, :class => 'show') if options[:show]
    string_return += link_to("Edit", eval(edit), :class => 'edit') if options[:edit]
    string_return += link_to('Destroy', object, :method => :delete, :confirm => 'Are you sure?', :class => 'destroy') if options[:delete]

    return string_return
  end

end

