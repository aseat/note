class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :buyer_id
      t.integer :item_id
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
