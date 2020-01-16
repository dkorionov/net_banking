Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin/admins', as: 'rails_admin'
  devise_for :users,
             path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret', sign_up: 'registration'},
             controllers: {
                 registrations: 'users/registrations'
             }
  devise_for :admins, path_names: {sign_in: 'login'}, controllers: {sessions: 'admins/sessions'}

  devise_for :managers, path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret'},
             controllers: {sessions: 'managers/sessions'}


  resource :users, only: [] do
    resources :bills, params: :type, shallow: true do
      resources :transactions, only: %i[show,create]
    end
    get '/:id', to: 'users/main#dashboard', as: 'profile'
  end

  resource :managers, only: [] do
    resources :manager_notifications, :bill_requests, except: %i[create update]
    resource :bills, params: :type
    resources :transactins, only: :show
    get '/:id', to: 'managers/main#dashboard', as: 'profile'
  end

  root to: 'pages#index'


end
