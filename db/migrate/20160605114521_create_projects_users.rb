class CreateProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_users, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end
  end
end
