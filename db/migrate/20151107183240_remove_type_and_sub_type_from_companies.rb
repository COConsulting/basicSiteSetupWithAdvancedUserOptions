class RemoveTypeAndSubTypeFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :type, :string
    remove_column :companies, :sub_type, :string
  end
end
