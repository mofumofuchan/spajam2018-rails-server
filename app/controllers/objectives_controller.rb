class ObjectivesController < ApplicationController
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
                    name: objective.title,
                    limit_date: objective.limit_date,
                    content: objective.content,
                    done: objective.done,
                    updated_at: objective.updated_at
                  }}
  end
end
