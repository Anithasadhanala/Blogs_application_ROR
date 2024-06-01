class DeleteATable2 < ActiveRecord::Migration[7.1]
  def change
    create_table :user_blog_reactions do |t|
    
      
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true
      t.references :reaction, foreign_key: true
      
      t.timestamps
   
  end
  end
end
