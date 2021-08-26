class CreateArticleBodies < ActiveRecord::Migration[6.1]
  def change
    create_table :article_bodies do |t|
      t.text :body
      t.text :image
      t.text :order
      t.references :article, null:false, foreign_key: true
      t.timestamps
    end
  end
end
