class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name, null: false
      t.text :project_description
      t.string :logo_url
      t.string :cover_img_url
      t.string :facebook_url
      t.string :twitter_handle
      t.string :instagram_url

      t.timestamps
    end
  end
end
