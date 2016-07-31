class ChangeColumnNameInStories < ActiveRecord::Migration
  def change
  	rename_column :stories, :published, :display
  end
end
