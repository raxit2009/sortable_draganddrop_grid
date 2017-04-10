class AddSortInPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :sort, :integer
  end
end
