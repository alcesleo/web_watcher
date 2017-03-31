# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

get "/users/:email", to: "users#show"

resources :watchers, only: %i[new create show destroy] do
  member do
    post :refresh
  end
end
