class AddIrsurlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :irs_url, :string, after: :nonprofit_number
  end
end
