class AddLocationToStories < ActiveRecord::Migration
  def change
    add_column :stories, :locationCity, :string
    add_column :stories, :locationState, :string
    add_column :stories, :locationZip, :string
    add_column :stories, :locationGPS, :string
  end
end
