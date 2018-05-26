class UsersController < ApplicationController
  def show
    user_id = params[:id].to_i

    user = User.find_by_id(user_id)
    if user.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    render json: {is_success: true,
                  content: {
                    name: user.name,
                    num_protein: user.num_protein
                  }}
  end
end
