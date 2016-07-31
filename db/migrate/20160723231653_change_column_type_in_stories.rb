class ChangeColumnTypeInStories < ActiveRecord::Migration
  def change
  		change_column :stories, :locationGPS, :float
  end
end
