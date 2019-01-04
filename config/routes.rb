Rails.application.routes.draw do
  resources :books
  resources :passages do
    member do
      get 'highlights', defaults: { format: :json }
    end
  end
  resources :highlights

  root 'application#index'
  get '/my-litcharts/highlights', to: 'highlights#my_highlights'
end
