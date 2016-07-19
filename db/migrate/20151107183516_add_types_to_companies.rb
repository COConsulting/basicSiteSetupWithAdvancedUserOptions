class AddTypesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :service_church, :boolean
    add_column :companies, :service_food_bank, :boolean
    add_column :companies, :service_medical_doctor, :boolean
    add_column :companies, :service_medical_dentist, :boolean
    add_column :companies, :service_medical_other, :boolean
    add_column :companies, :service_medical_other_description, :string
    add_column :companies, :service_shelter_womans, :boolean
    add_column :companies, :service_shelter_mens, :boolean
    add_column :companies, :service_shelter_family, :boolean
    add_column :companies, :service_shelter_other, :boolean
    add_column :companies, :service_shelter_other_description, :string
  end
end
