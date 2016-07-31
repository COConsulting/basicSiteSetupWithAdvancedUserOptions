class ChangeColumnName < ActiveRecord::Migration
  def change
  		rename_column :stories, :locationGPS, :latitude
  		add_column :stories, :longitude, :float
  end
end
