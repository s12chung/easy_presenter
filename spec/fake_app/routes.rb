FakeApp::Application.routes.draw do
  resources :users, :only => [:show]

  resources :trees, :only => [:show]
end