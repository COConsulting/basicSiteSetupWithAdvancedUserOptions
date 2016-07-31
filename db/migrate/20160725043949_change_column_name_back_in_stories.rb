class ChangeColumnNameBackInStories < ActiveRecord::Migration
  def change
  	rename_column :stories, :display, :published
  end
end
