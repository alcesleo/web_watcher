# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
resources :watchers, only: [:new, :create, :show, :destroy] do
  member do
    post :refresh
  end
end
