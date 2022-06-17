class AddEmailToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :email, :string
  end
end
