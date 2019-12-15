Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin/admins', as: 'rails_admin'
  devise_for :admins, skip: :registration, controllers: {
      sessions: 'admins/sessions' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
