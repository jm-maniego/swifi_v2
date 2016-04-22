Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :liquidation_form_lines, path: :liquidation_form
  root "home#index", path: "dashboard"
  get '/' => redirect("/dashboard")

  resources :expense_categories do
    collection do
      get 'defaults'
      get 'defaults/new' => 'expense_categories#new_default'
    end
  end

  resources :import_liquidation_categories, controller: :liquidation_categories, type: "LiquidationCategory"
  resources :export_liquidation_categories, controller: :liquidation_categories
  resources :liquidation_categories do
    collection do
      get 'defaults'
      get 'defaults/new_import_row' => 'liquidation_categories#new_import_row'
      get 'defaults/new_export_row' => 'liquidation_categories#new_export_row'
    end
  end

  resources :job_orders do
    resources :expenses do
      resources :liquidations
    end
  end

  resources :clients
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
