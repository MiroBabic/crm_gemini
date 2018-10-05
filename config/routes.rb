Rails.application.routes.draw do


  devise_for :users, :controllers => {:sessions => "users/sessions", :registrations => "users/registrations"}
  
  devise_scope :user do
    match 'users/:id' => 'users/registrations#destroy', :via => :delete, :as => :admin_destroy_user
    post 'modal_edit_user' => 'users/registrations#modal_edit_user', :as => 'modal_edit_user'
    post 'modal_create_user' => 'users/registrations#modal_create_user', :as => 'modal_create_user'
  end

  


  resources :people
  resources :districts
  
  resources :subjects
  resources :cities
  resources :subjtypes

  #static pages
  get '/kontakty' => 'static_pages#contacts', :as => 'contacts'
  get '/uzivatelia' => 'static_pages#users', :as => 'users'

  #subjtypes
  post '/modal_create_subj_type' => 'subjtypes#modal_create_subj_type', :as=> 'modal_create_subj_type'
  post '/modal_edit_subj_type' => 'subjtypes#modal_edit_subj_type', :as=> 'modal_edit_subj_type'

  #contacts

  post '/modal_create_subj' => 'subjects#modal_create_subj', :as=> 'modal_create_subj'
  post '/modal_create_person' => 'people#modal_create_person', :as=> 'modal_create_person'
  post '/modal_edit_subj' => 'subjects#modal_edit_subj', :as=> 'modal_edit_subj'
  post '/modal_edit_person' => 'people#modal_edit_person', :as=> 'modal_edit_person'
  get '/get_subject_contacts/:id' => 'people#get_subject_contacts', :as => 'get_subject_contacts'
  

  

  root 'static_pages#home'
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
