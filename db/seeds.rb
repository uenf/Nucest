# -*- encoding : utf-8 -*-
# Limpa o banco de dados
Usuario.delete_all
Instituicao.delete_all
Area.delete_all
Representante.delete_all
Supervisor.delete_all

Usuario.create(:email => 'roosmaia@uenf.br', :password => 'hugo123', :password_confirmation => 'hugo123')

