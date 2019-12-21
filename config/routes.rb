

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin/admins', as: 'rails_admin'
  devise_for :users,
             path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret', sign_up: 'registration'},
             controllers: {
                 registrations: 'main/registrations'
             }
  devise_for :admins, path_names: {sign_in: 'login', sign_out: 'logout'},
             controllers: {sessions: 'admins/sessions'}
  devise_for :managers, path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret'}

  namespace 'users' do
    get '/:id', to: 'main#dashboard', as: 'user_profile'
    resources :bills do
      resources :transactions
    end

  end
  root to: 'pages#index'


end
