Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'students#index'

  put 'students/:id/edit', to: 'students#update'
  post 'students/new', to: 'students#create'

  resources :schools, :students
end
