# -*- encoding : utf-8 -*-

Dado /^que eu estou logado$/ do
  @usuario ||= FactoryGirl.create :usuario

  Dado %{que eu estou na página de login}
  E %{eu preencho "usuario_email" com "#{@usuario.email}"}
  E %{eu preencho "usuario_password" com "#{@usuario.password}"}
  E %{eu pressiono "Login"}
end

