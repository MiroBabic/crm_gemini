Rails.application.routes.draw do

    
  
  mount LetsencryptPlugin::Engine, at: '/'  # It must be at root level
  

  devise_for :users, :controllers => {:sessions => "users/sessions", :registrations => "users/registrations"}, :skip => [:registrations]
  
  devise_scope :user do
    match 'users/:id' => 'users/registrations#destroy', :via => :delete, :as => :admin_destroy_user
    post 'modal_edit_user' => 'users/registrations#modal_edit_user', :as => 'modal_edit_user'
    post 'modal_create_user' => 'users/registrations#modal_create_user', :as => 'modal_create_user'
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'    
    patch 'users' => 'users/registrations#update', :as => 'user_registration'
  end

 resources :oprograms
   resources :iactivities
  resources :invoices
  resources :impchanges
  resources :implementations
  resources :procurements 
  resources :projects
  resources :projecttargets
  resources :people
  resources :districts
  resources :documents
  resources :communications
  resources :subjects
  resources :cities
  resources :subjtypes
   resources :userprofiles
  resources :mailtemplates
  resources :calendars
  resources :media

  #static pages
  get '/kontakty' => 'static_pages#contacts', :as => 'contacts'
  get '/uzivatelia' => 'static_pages#users', :as => 'users'
  get '/posli_email' => 'static_pages#create_email', :as=> 'create_email'
  get '/procesy' => 'static_pages#job_queue', :as=> 'job_queue'
  post '/send_mail_to_subjects' => 'static_pages#send_mail_to_subjects', :as=> 'send_mail_to_subjects'
  post 'delete_delayed_job'=>'static_pages#delete_delayed_job', :as=>'delete_delayed_job'
  get '/unsubscribe/:id' => 'static_pages#unsubscribe', :as=>'unsubscribe'
  
  get '/export'=> 'static_pages#export', :as=> 'export'


  #subjtypes
  post '/modal_create_subj_type' => 'subjtypes#modal_create_subj_type', :as=> 'modal_create_subj_type'
  post '/modal_edit_subj_type' => 'subjtypes#modal_edit_subj_type', :as=> 'modal_edit_subj_type'

  #contacts

  post '/modal_create_subj' => 'subjects#modal_create_subj', :as=> 'modal_create_subj'
  post '/modal_create_person' => 'people#modal_create_person', :as=> 'modal_create_person'
  post '/modal_edit_subj' => 'subjects#modal_edit_subj', :as=> 'modal_edit_subj'
  post '/modal_edit_person' => 'people#modal_edit_person', :as=> 'modal_edit_person'
  get '/get_subject_contacts/:id' => 'people#get_subject_contacts', :as => 'get_subject_contacts'
  get '/profil_kontaktu/:id' => 'subjects#show_subject_profile', :as=>'show_subject_profile'
  get '/subjectexport' => 'subjects#subjectexport', :as=>'subjectexport'

  
  #communication
  post '/modal_create_comm' => 'communications#modal_create_comm', :as=> 'modal_create_comm'
  post '/modal_update_comm' => 'communications#modal_update_comm', :as=> 'modal_update_comm'
  get '/komunikacia' => 'communications#index', :as=> 'komunikacia'
  get '/get_subject_communication/:id' => 'communications#get_subject_communication', :as=> 'get_subject_communication'
  post '/del_communication' => 'communications#del_communication', :as => 'del_communication'

  #documents
  post '/insertfile' => 'documents#insertfile', :as=> 'insertfile'
  get '/download_doc/:id' => 'documents#download_doc', :as=> 'download_doc'
  get '/dokumenty' => 'documents#index', :as=>'dokumenty'

  #calendar
  get '/kalendar' => 'calendars#show_calendar', :as=> 'show_calendar'
  get '/get_calendar_events' => 'calendars#get_calendar_events', :as=>'get_calendar_events'
  post '/add_calendar_event' => 'calendars#add_calendar_event', :as=>'add_calendar_event'
  post '/edit_calendar_event' => 'calendars#edit_calendar_event', :as=>'edit_calendar_event'
  post '/remove_calendar_event' => 'calendars#remove_calendar_event', :as=>'remove_calendar_event'
  get '/get_user_calendar/:id' => 'calendars#get_user_calendar', :as=>'get_user_calendar'

  #emails
  get '/sablony' => 'mailtemplates#index', :as=>'sablony'
  post '/modal_create_mail_template' => 'mailtemplates#modal_create_mail_template', :as=>'modal_create_mail_template'
  post '/modal_update_mail_template' => 'mailtemplates#modal_update_mail_template', :as=>'modal_update_mail_template'
  get '/get_template/:id' => 'mailtemplates#get_template', :as=> 'get_template'

  #userprofile
  get '/profil_uzivatela' => 'userprofiles#showprofile', :as=> 'showprofile'
  post '/edit_user_profile' => 'userprofiles#edit_user_profile', :as=>'edit_user_profile'

  #media
  get '/download_media/:id' => 'media#download_media', :as=> 'download_media'
  get '/subory' => 'static_pages#subory', :as=>'subory'
  #get '/subory' => 'media#subory', :as=>'subory'
  
  #imports
  get '/imports' => 'imports#index'
  post '/importsubjects' => 'imports#importsubjects', :as => 'importsubjects'

  #project targets
  post '/modal_create_project_target' => 'projecttargets#modal_create_project_target', :as=> 'modal_create_project_target'
  post '/modal_edit_project_target' => 'projecttargets#modal_edit_project_target', :as=> 'modal_edit_project_target'

  #projects
  get '/projekty' => 'projects#index', :as=>'projekty'
  post '/modal_create_project' => 'projects#modal_create_project', :as=>'modal_create_project'
  post '/modal_edit_project' => 'projects#modal_edit_project', :as=>'modal_edit_project'
  get '/projekt/:id' => 'projects#show_project_detail', :as=> 'show_project_detail'

  get '/implementacie' => 'implementations#index', :as=>'implementacie'
  post '/modal_create_implementation' => 'implementations#modal_create_implementation', :as=>'modal_create_implementation'
  post '/modal_edit_implementation' => 'implementations#modal_edit_implementation', :as=>'modal_edit_implementation'
  get '/get_implementation_notes/:id' => 'implementations#get_implementation_notes', :as=>'get_implementation_notes'
  post '/del_implementation_note' => 'implementations#del_implementation_note', :as => 'del_implementation_note'
  post '/modal_create_implementation_note' => 'implementations#modal_create_implementation_note', :as=>'modal_create_implementation_note'

  #oprograms
  post '/modal_create_oprogram' => 'oprograms#modal_create_oprogram', :as=> 'modal_create_oprogram'
  post '/modal_edit_oprogram' => 'oprograms#modal_edit_oprogram', :as=> 'modal_edit_oprogram'
  get '/operacneprogramy' => 'oprograms#index', :as=>'operacneprogramy'

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
