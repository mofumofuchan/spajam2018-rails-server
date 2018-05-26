class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :title
      t.date :limit_date
      t.text :content
      t.boolean :done
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
