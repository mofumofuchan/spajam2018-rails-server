class AddColumnToObjective < ActiveRecord::Migration[5.2]
  def change
    add_column :objectives, :achievement, :integer
  end
end
