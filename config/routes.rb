Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin/admins', as: 'rails_admin'

  devise_for :users,
             path_names:
                 { sign_in: 'login', sign_out: 'logout',
                  password: 'secret', sign_up: 'registration' },
             controllers: {
                 registrations: 'users/registrations'
             }

  devise_for :admins, skip: :registration,
             path_names: { sign_in: 'login', sign_out: 'logout' },
             controllers: { sessions: 'admins/sessions' }

  devise_for :managers, skip: :registration,
             path_names:
                 { sign_in: 'login', sign_out: 'logout',
                  password: 'secret' }

  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
