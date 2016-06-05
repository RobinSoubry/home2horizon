class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :brand_id, null: false
      t.integer :project_id, null: false
      t.text :special_note
      t.integer :status, null: false

      t.timestamps
    end
  end
end