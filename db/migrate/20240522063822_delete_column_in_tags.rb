class DeleteColumnInTags < ActiveRecord::Migration[7.1]
  def change
    remove_column :tags, :string, :string
  end
end
