Rails.application.routes.draw do
  get 'users/show'
  root to: "static_pages#index"
  
  scope "api" do
    scope "v0" do
      scope "user" do
        get ":id", to: "users#show"
      end
      
      scope "objective" do
        get "/",   to: "objectives#index"
        get ":id", to: "objectives#show"
        post "/",  to: "objectives#create"
      end

      scope "protein" do
        get "/send/from/:from_id/to/:to_id", to: "protein#send_protein"
      end
    end
  end
end
