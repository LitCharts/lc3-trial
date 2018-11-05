Rails.application.routes.draw do

  root 'themes#index'
  get 'lit/the-aeneid/themes', to: 'themes#index'

end
