Rails.application.routes.draw do
  root to: "static_pages#index"
  
  scope "api" do
    scope "v0" do
      scope "objective" do
        get "/",   to: "objectives#index"
        get ":id", to: "objectives#show"
        post "/",  to: "objectives#create"
      end
    end
  end
end
