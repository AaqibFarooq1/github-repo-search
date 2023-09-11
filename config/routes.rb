Rails.application.routes.draw do

  root "repositories#index"

  get "/repo_search", to: "repositories#repo_search"
end
