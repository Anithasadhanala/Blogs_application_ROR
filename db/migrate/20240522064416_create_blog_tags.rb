class CreateBlogTags < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_tags do |t|

      t.timestamps
    end
  end
end
