# -*- encoding : utf-8 -*-
Fancytest::Application.routes.draw do

  resources :sheets

  resources :papers

  resources :attaches

#  scope ":username", :as => "account" do
#    resources :questions
#  end

#  resources :statuses,   :path_prefix => '/:username'
#  # resources :users,     :except => [:show]
#  match '/:username', :controller => 'account', :action => 'show'

  match '/settings' => 'users#edit'

  resources :relations

  resources :searches

  resources :dashboards, :controller => 'records'

  resources :records

  resources :quizzes

  resources :comments

  resources :treeings

  resources :options

  resources :responses

  resources :answers

  resources :questions
  resources :exams do
    resources :questions
    resources :responses
  end

  resources :categories do
    resources :skills
  end

#  resources :accounts do
#    resources :skills#, :controller => :exams
#  end

  resources :skills#, :controller => :exams
  resources :skills do
    resources :sheets
    resources :questions
    resources :accounts
    resources :users
    # resources :responses
  end

  resources :interests do
    resources :questions
  end

  resources :categories

  resources :trees


  # devise_for :users
  devise_for :users, :path => "accounts", :controllers => {
      :registrations => :accounts,
      :omniauth_callbacks => "users/omniauth_callbacks"
    }
  match "accounts/auth/:provider/unbind", :to => "users#auth_unbind"

  devise_scope :user do
    match '/users/:id' => "accounts#show"
    # match '/accounts/:id' => 'accounts#show'
  end

  resources :users, :controller => 'accounts' do
    resources :skills
  end
  resources :authorizations

  get "welcome/index"

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
  root :to => 'welcome#index'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
