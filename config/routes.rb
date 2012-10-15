# -*- encoding : utf-8 -*-
Nucest::Application.routes.draw do


  devise_for :usuarios

  resources :estagiarios
  resources :usuarios
  resources :areas

  resources :instituicoes do
    resources :representantes
    resources :supervisores
    resources :convenios
  end

  resources :itens_tramitacao, :except => [ :edit, :new, :show ]

  match '/buscar_cep' => 'instituicoes#buscar_cep'
  match '/instituicoes/:id/areas', :to => 'instituicoes#areas', :as => :areas_instituicao
  match '/instituicoes/:instituicao_id/convenios/:id/gerar_termo', :to => 'convenios#gerar_termo', :as => :gerar_termo_convenio
  match '/intituicaoes/:instituicao_id/convenios/:id/finalizar_tramitacao', :to => 'convenios#finalizar_tramitacao', :as => :finalizar_tramitacao
  match '/areas/:father_id/new', :to => 'areas#new', :as => :new_sub_area
  match '/findar_convenios' => 'convenios#findar_convenios', :as => :findar_convenios

  match ':controller(/:action(/:id))'
  match ':controller(/:action(/:id(.:format)))'

  root :to => 'instituicoes#index'
end

