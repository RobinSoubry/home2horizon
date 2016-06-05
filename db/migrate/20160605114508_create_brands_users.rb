class CreateBrandsUsers < ActiveRecord::Migration
  def change
    create_table :brands_users do |t|
      t.belongs_to :brand, index: true
      t.belongs_to :user, index: true
    end
  end
end