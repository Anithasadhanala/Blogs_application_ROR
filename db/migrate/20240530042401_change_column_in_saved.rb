class ChangeColumnInSaved < ActiveRecord::Migration[7.1]
  def change
    change_column_default :saved_blogs, :saved, true
    change_column_default :saved_blogs, :starred, false
  end
end
