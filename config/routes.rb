Rails.application.routes.draw do

  
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      get   'users',           to: 'users#index',   as: 'users'
      patch 'users_update/:id', to: 'users#update',  as: 'users_update'
      delete 'users_delete/:id', to: 'users#delete',  as: 'users_delete'
    end
  end

end
