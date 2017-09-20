Rails.application.routes.draw do
  root to: "contacts#index"
  # resources :contacts, only: %w(show index)

  resources :contacts do
    collection do
      get 'send_message'
    end
  end

end
