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
                    start: objective.start,
                    end: objective.end,
                    menu: objective.menu,
                    achievement: objective.achievement,
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
        start: o.start,
        end: o.end,
        menu: o.menu,
        done: o.done,
        achievement: o.achievement,
        updated_at: o.updated_at
      }}
    render json: {is_success: true,
                  content: content}
  end


  def user_objectives
    user_id = params[:user_id].to_i
    user = User.find_by_id(user_id)

    if user.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    objectives = Objective.where(user_id: user.id)

    if objectives.empty?
      render json: {is_success: true,
                    content: []}
      return
    end

    content = objectives.map { |o|
      {
        id: o.id,
        title: o.title,
        name: o.user.name,
        start: o.start,
        end: o.end,
        menu: o.menu,
        done: o.done,
        achievement: o.achievement,
        updated_at: o.updated_at
      }}
    render json: {is_success: true,
                  content: content}
  end


  def create
    post_param = params.permit(:id, :title, :start, :end, :menu)

    user = User.find_by_id(post_param[:id])
    if user.nil?
      render json: {is_success: false,
                    message: "not found"},
             status: 404
      return
    end

    objective = Objective.new(title: post_param[:title],
                              start: post_param[:start],
                              end: post_param[:end],
                              menu: post_param[:menu],
                              done: false,
                              achievement: 0,
                              user: user)
    objective.save!

    render json: {is_success: true,
                  message: "successfully create an objective"}
  end
end
