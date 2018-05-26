class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_protein, :integer
  end
end
