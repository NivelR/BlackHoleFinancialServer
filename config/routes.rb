Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :transactions
  resources :tags

  #Tiene que estar logueado para poder ver.
  #authenticated do
    get '/users/report', to: 'reports#report', as: 'report'
    get '/get_expenses_sum', to: 'reports#get_expenses_sum', as: :get_expenses_sum
    get '/get_incomes_sum', to: 'reports#get_incomes_sum', as: :get_incomes_sum
    get '/get_expenses_between', to: 'reports#get_expenses_between', as: :get_expenses_between
  #end  #authenticated

  # root to: "users/sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
