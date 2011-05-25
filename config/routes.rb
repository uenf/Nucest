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

  resources :itens_tramitacao, :except => [ :index, :new, :edit, :show ]

#  post '/instituicoes/:instituicao_id/convenios/:convenio_id/itens_tramitacao', :to => 'itens_tramitacao#create', :as => :create_item_tramitacao

  match '/buscar_cep' => 'application#buscar_cep'
  match '/instituicoes/:id/areas', :to => 'instituicoes#areas', :as => :areas_instituicao
  match '/instituicoes/:instituicao_id/convenios/:id/gerar_termo', :to => 'convenios#gerar_termo', :as => :gerar_termo_convenio
  match '/areas/:father_id/new', :to => 'areas#new', :as => :new_sub_area
  match ':controller(/:action(/:id))'
  match ':controller(/:action(/:id(.:format)))'

  root :to => 'instituicoes#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

