class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                nulll: false
      t.text       :description,         nulll: false
      t.integer    :category_id,         nulll: false
      t.integer    :status_id,           nulll: false
      t.integer    :delivery_fee_id,     nulll: false
      t.integer    :prefecture_id,       nulll: false
      t.integer    :day_to_deliver_id,   nulll: false
      t.integer    :price,               nulll: false
      t.references :user,                nulll: false, foreign_key: true

      t.timestamps
    end
  end
end
