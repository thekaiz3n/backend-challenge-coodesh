Rails.application.routes.draw do
  resources :cases
  root to: 'cases#index'

  get 'cases/:getdate/count', to: 'cases#get_count'

  get 'dates', to: 'cases#get_dates'

  get 'cases/:getdate/cumulative', to: 'cases#get_cumulative'

  get "*route_not_found.:format", :to => "cases#not_found"
  get "*route_not_found",         :to => "cases#not_found"
end
