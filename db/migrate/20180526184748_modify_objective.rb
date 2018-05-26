class ModifyObjective < ActiveRecord::Migration[5.2]
  def change
    add_column :objectives, :start, :date
    rename_column :objectives, :limit_date, :end
    rename_column :objectives, :content, :menu
  end
end
