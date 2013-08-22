FakeApp::Application.routes.draw do
  resources :users, :only => [:index, :show] do
    resources :games, :only => [:show]
  end

  resources :trees, :only => [:show]
end