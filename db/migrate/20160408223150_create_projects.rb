class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null:false
      t.string :description
      t.integer :token, unique:true
      t.integer :parent_project_id

      t.timestamps null: false
    end
    add_index :projects, :parent_project_id
  end
end
