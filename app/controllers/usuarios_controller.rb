# -*- encoding : utf-8 -*-
class UsuariosController < InheritedResources::Base
  before_filter :breadcrumbs

  def create
    create!(:notice => "Usuário cadastrado com sucesso.") { usuarios_path }
  end

  def update
    update!(:notice => "Usuário atualizado com sucesso.") { usuarios_path }
  end

  def breadcrumbs
    add_breadcrumb 'Usuarios', :usuarios_path
  end

end

