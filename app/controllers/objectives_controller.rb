class ObjectivesController < ApplicationController
  protect_from_forgery except: [:create]

  MAX_OBJECTIVES = 20  # 一度に返すObjectiveの数
  
  def show
    objective_id = params[:id].to_i

    objective = Objective.find_by_id(objective_id)
    if objective.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    render json: {is_success: true,
                  content: {
                    id: objective.id,
                    name: objective.user.name,
                    title: objective.title,
                    limit_date: objective.limit_date,
                    content: objective.content,
                    done: objective.done,
                    updated_at: objective.updated_at
                  }}
  end

  def index
    objectives = Objective.all.order("updated_at DESC").limit(MAX_OBJECTIVES)
    if objectives.empty?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    content = objectives.map { |o|
      {
        id: o.id,
        title: o.title,
        name: o.user.name,
        limit_date: o.limit_date,
        content: o.content,
        done: o.done,
        updated_at: o.updated_at
      }}
    render json: {is_success: true,
                  content: content}
  end

  def create
    post_param = params.permit(:user_id, :title, :limit_date, :content)

    user = User.find_by_id(post_param[:user_id])
    if user.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    objective = Objective.new(title: post_param[:title],
                              limit_date: post_param[:limit_date],
                              content: post_param[:content],
                              done: false,
                              user: user)
    objective.save!

    render json: {is_success: true,
                  message: "successfully create an objective"}
  end
end
