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

end

