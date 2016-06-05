class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null:false
      t.string :username, null:false
      t.text :personal_description
      t.string :profile_pic_url
      t.string :facebook_url
      t.string :twitter_handle
      t.string :instagram_url

      t.timestamps
    end
  end
end
