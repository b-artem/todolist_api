Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # with_options only: %i[index create update delete] do |list_only|
  #   list_only.resources :projects
  # end
  namespace :api do#, defaults: { format: :json } do
    namespace :v1, constraints: lambda { |req| req.format == :json } do
      resources :projects, only: %i[index create update destroy]
    end
  end
end
