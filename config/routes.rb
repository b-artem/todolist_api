Rails.application.routes.draw do
  scope '/api/v1' do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  # with_options only: %i[index create update delete] do |list_only|
  #   list_only.resources :projects
  # end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, only: %i[index show create update destroy] do
        resources :tasks, only: %i[index create update destroy]
      end
    end
  end
end
