Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' }

  defaults format: :json do
    resources :courses, only: %i[create index show update destroy]
    resources :enrolments, only: %i[create index show update destroy]
  end
end
