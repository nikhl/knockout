Knockout::Application.routes.draw do
  scope "api" do
    resources :teams
  end
  
  root :to => "main#index"
end
