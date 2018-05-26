Rails.application.routes.draw do
  root to: "static_pages#index"
  
  scope "api" do
    scope "v0" do
      scope "objective" do
        get ":id", to: "objectives#show"
      end
    end
  end
end
