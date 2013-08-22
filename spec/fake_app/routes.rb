FakeApp::Application.routes.draw do
  resources :users, :only => [:index, :show]

  resources :trees, :only => [:show]
end