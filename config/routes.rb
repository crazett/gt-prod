Rails.application.routes.draw do
  devise_for :users
  resources :gts do
    member do
      get 'update_prio'
      get 'update_checkboxes'
    end
  end
  resources :customers
  root 'gts#index'
  match "/statistik" => "gts#statistik", via: [:get, :post]
  match "/sortera" => "gts#sortera", via: [:get, :post]
  match "/senast_levererad" => "gts#senast_levererad", via: [:get, :post]
  match "/arkiv" => "gts#arkiv", via: [:get, :post]
end
