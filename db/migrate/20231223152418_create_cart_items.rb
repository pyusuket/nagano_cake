class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer  :item_id       ,null: false, default: ""    ,foreign_key: true
      t.integer  :customer_id   ,null: false, default: ""    ,foreign_key: true
      t.integer  :amount        ,null: false, default: ""
      t.timestamps
    end
  end
end
