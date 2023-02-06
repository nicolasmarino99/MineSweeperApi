Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :games do
      resources :cells, only: %i[reveal flag] do
        member do
          post :reveal
          post :flag
        end
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
