Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin/admins', as: 'rails_admin'

  devise_for :users,
             path_names:
                 {sign_in: 'login', sign_out: 'logout',
                  password: 'secret', sign_up: 'registration'},
             controllers: {
                 registrations: 'users/registrations'
             }

  devise_for :admins, skip: :registration,
             path_names: {sign_in: 'login', sign_out: 'logout'},
             controllers: {sessions: 'admins/sessions'}

  root to: redirect("/users/login")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
