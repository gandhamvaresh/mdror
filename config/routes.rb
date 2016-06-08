MDManage::Application.routes.draw do
  get "archives/index"
  get "archives/users"
  get "archives/clients"
  get "archives/patients"
  get "archives/accidents"
  get "archives/chiropractic_examinations"
  get "archives/chiropractic_treatments"
  get "archives/insurance_companies"
  
  get "reports/index"
  get "reports/weekly_summary"
  get "reports/monthly_summary"

  get "signup" => "users#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :insurance_companies
  
  resources :patients do
    delete "remove"
    resources :accidents do
      resources :chiropractic_examinations do
        member do
          get 'insurance_claim_processed'
          get 'print_friendly'
        end
        
        resource :chiropractic_symptom_list
        resource :chiropractic_investigation_list
        resource :chiropractic_diagnosis_list
        resource :chiropractic_treatment_plan
        resource :chiropractic_assessment
        resource :chiropractic_compliance
        
        resources :chiropractic_treatments do
          member do
            get 'insurance_claim_processed'
            get 'print_friendly'
          end
          
          resource :chiropractic_observation_list
          resource :chiropractic_body_adjustment_list
          resource :chiropractic_modalities_list
        end
      end
    end
  end

  resources :users do
    collection do
      get 'new_external'
      get 'doctor_dashboard'
    end
    
    member do
      get 'ignore_re_examination_reminders'
    end
  end
  
  resources :clients do
    member do
      get 'pending_examinations'
      get 'completed_examinations'
      get 'processed_examinations'
      get 'pending_treatments'
      get 'completed_treatments'
      get 'processed_treatments'
      get 'users'
    end
  end
  
  resources :roles
  resources :sessions
  resources :password_resets
  
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
  root :to => "sessions#new"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
