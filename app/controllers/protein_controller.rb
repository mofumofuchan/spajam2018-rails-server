class ProteinController < ApplicationController
  def send_protein
    from_user_id = params[:from_id]
    to_user_id   = params[:to_id]

    from_user = User.find_by_id(from_user_id)
    to_user   = User.find_by_id(to_user_id)
    if from_user.nil? || to_user.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    # プロテインを増やす
    to_user.num_protein += 1
    to_user.save!

    # キューに追加
    ProteinQueue.create!(from_user_id: from_user.id, to_user_id: to_user.id)

    render json: {is_success: true,
                  content: {
                    from_user_id: from_user_id,
                    to_user_id:   to_user_id,
                    num_protein:  to_user.num_protein
                  }}
  end
end
