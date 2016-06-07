class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name, null: false
      t.text :project_description
      t.string :tags, array: true
      t.string :location
      t.string :website_url
      t.string :logo_url
      t.string :cover_img_url
      t.string :facebook_url
      t.string :twitter_handle
      t.string :instagram_url
      t.text :target_audience
      t.text :sponsorship_format
      t.integer :status

      t.timestamps
    end
  end
end
