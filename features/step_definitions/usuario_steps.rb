# -*- encoding : utf-8 -*-

Dado /^que eu estou logado$/ do
  @usuario ||= FactoryGirl.create :usuario

  step(%{que eu estou na página de login})
  step(%{eu preencho "usuario_email" com "#{@usuario.email}"})
  step(%{eu preencho "usuario_password" com "#{@usuario.password}"})
  step(%{eu pressiono "Login"})
end

