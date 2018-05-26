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
    queue = ProteinQueue.new(from_user_id: from_user.id, to_user_id: to_user.id)
    print(queue.valid?)
    queue.save!

    render json: {is_success: true,
                  content: {
                    from_user_id: from_user_id,
                    to_user_id:   to_user_id,
                    num_protein:  to_user.num_protein
                  }}
  end


  def check_queue
    user_id = params[:user_id]
    user = User.find_by_id(user_id)
    if user.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    poped = ProteinQueue.where(to_user_id: user.id)
    if poped.empty?
      render json: {is_success: true,
                    content: []}
      return
    end

    content = poped.map {|p|
      {
        from_user_id: p.from_user_id,
        from_user_name: User.find(p.from_user_id).name,
        to_user_id: p.to_user_id,
        to_user_name: User.find(p.to_user_id).name
      }}

    poped.each {|p| p.destroy}

    render json: {is_success: true,
                  content: content}
  end
end
