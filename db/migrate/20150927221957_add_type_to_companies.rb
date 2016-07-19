class AddTypeToCompanies < ActiveRecord::Migration
  def change
  	change_table :companies do |t|
  		t.string :type
  		t.string :sub_type
  	end
  end
end
