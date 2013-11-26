FluvigestWebApp::Application.routes.draw do

  get "tipo_servicios/new"
  get "tipo_servicios/create"
  get "tipo_servicios/show"
  get "tipo_servicios/index"
  get "tipo_servicios/edit"
  get "tipo_servicios/update"
  get "tipo_servicios/destroy"
  get "servicio_contratados/new"
  get "servicio_contratados/create"
  get "servicio_contratados/show"
  get "servicio_contratados/index"
  get "servicio_contratados/edit"
  get "servicio_contratados/update"
  get "servicio_contratados/destroy"
  get "domiciliaciones/new"
  get "domiciliaciones/create"
  get "domiciliaciones/show"
  get "domiciliaciones/index"
  get "domiciliaciones/edit"
  get "domiciliaciones/update"
  get "domiciliaciones/destroy"
  get "tipo_forma_pagos/new"
  get "tipo_forma_pagos/create"
  get "tipo_forma_pagos/show"
  get "tipo_forma_pagos/index"
  get "tipo_forma_pagos/edit"
  get "tipo_forma_pagos/update"
  get "tipo_forma_pagos/destroy"
  resources :abonados do
    resources :contratos
  end
  resources :contadores
  resources :inmuebles
  resources :barrios
  resources :calles
  resources :modelos_contadores

  get "main/index"
  root 'main#index'

  get 'facturas/generar' => 'facturas#show_generar'
  post 'facturas/generar' => 'facturas#generar'

  get 'facturas/show_factura' => 'facturas#show_factura'

  get 'facturas/emitir' => 'facturas#show_emitir'
  post 'facturas/emitir' => 'facturas#emitir'


  get 'tarifas/new'=> 'tarifas#new'
  get 'tarifas/show'=>'taridas#show'

  resources :tarifas

  resources :linea_facturas
  resources :facturas do
    resources :linea_facturas
  end
  resources :facturas

  resources :lecturas

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
