class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id    ,null: false, default: ""  ,foreign_key: true
      t.string  :name           ,null: false, default: ""
      t.string  :postal_code    ,null: false, default: ""
      t.string  :address        ,null: false, default: ""
      t.integer :postage        ,null: false, default: ""
      t.integer :payment_method ,null: false, default: ""  
      t.integer :total_payment  ,null: false, default: ""
      t.integer :order_status   ,null: false, default: 1
      t.timestamps
    end
  end
end
