FakeApp::Application.routes.draw do
  resources :users, :only => [:show]
end