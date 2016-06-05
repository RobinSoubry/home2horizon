class CreateBrandsUsers < ActiveRecord::Migration
  def change
    create_table :brands_users do |t|
      t.integer :brand_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
