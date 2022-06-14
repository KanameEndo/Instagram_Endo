class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :title
      t.text :content
      t.text :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end