class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name, null: false
      t.text :project_description
      t.string :tags, array: true
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
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
