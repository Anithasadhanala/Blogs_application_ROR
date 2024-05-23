class AddReferenceOfTagsBlogsInBlogTags < ActiveRecord::Migration[7.1]
  def change
    add_reference :blog_tags, :blogs, foreign_key: true
    add_reference :blog_tags, :tags, foreign_key: true
  end
end
