Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :lit_guides, only: [:index, :show], path: 'lit-guides' do
    resources :highlights, only: [:create, :update, :destroy]
  end

  get 'my-guides/notes' => 'highlights#index', as: :my_highlights

  # You can have the root of your site routed with "root"
  root 'application#index'
end
