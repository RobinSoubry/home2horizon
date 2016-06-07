class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brand_name, null: false
      t.string :logo
      t.text :brand_description
      t.text :sponsorship_rules

      t.timestamps
    end
  end
end
