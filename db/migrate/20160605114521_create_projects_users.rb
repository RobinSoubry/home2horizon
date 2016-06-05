class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
  end
end
