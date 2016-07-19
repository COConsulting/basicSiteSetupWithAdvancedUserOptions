class ChangeOfficePhoneToString < ActiveRecord::Migration
  def change
  	change_column :companies, :office_phone,  :string
  	change_column :companies, :fax_phone,  :string
  end
end
