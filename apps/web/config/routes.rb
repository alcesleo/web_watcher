# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

redirect "/", to: "/watchers/new"

get "/users/:email", to: "users#show", as: :user

resources :watchers, only: %i[new create show destroy] do
  member do
    post :refresh
  end
end
