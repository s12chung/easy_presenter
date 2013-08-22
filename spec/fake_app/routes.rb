FakeApp::Application.routes.draw do
  resources :users, :only => [:index, :show, :new] do
    resources :games, :only => [:show]
  end

  resources :trees, :only => [:show]
end