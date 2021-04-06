class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :address 
      t.string :item
      t.integer :item_price 
      t.integer :quantity 
      t.integer :total 
      t.integer :user_id 
    end 
  end
end
