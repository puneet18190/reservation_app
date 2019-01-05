Rails.application.routes.draw do
  # resources :restaurants, only: [] do
    resources :reservations, only: [:index, :create, :update]
  # end

  # get 'reservations/index'
  # root 'reservations/index'

  post '/create_reservation' => 'reservations#create_reservation'
end
