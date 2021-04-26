class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :products_name, null:false
      t.integer :price, null:false
      t.references :user, null:false, foreign_key:true
      t.integer :category_id, null: false
      t.integer :products_states_id, null:false
      t.integer :shipping_id, null:false
      t.integer :admins_information_id, null:false
      t.integer :arrival_date_id, null:false
      t.text  :comments, null:false
      t.timestamps
    end
  end
end
