class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer:genre_id       ,null: false, default: ""    ,foreign_key: true
      t.string :name           ,null: false, default: ""
      t.text   :introduction   ,null: false, default: ""
      t.integer:price          ,null: false, default: ""
      t.boolean :sale_status   ,null: false, default: "true"
      t.timestamps
    end
  end
end
