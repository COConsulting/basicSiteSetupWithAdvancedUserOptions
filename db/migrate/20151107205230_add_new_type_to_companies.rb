class AddNewTypeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :service_food_meal, :boolean, after: :service_food_bank
  end
end
