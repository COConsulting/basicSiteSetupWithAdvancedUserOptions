class CreateCompanies < ActiveRecord::Migration
  def change
    create_table(:companies) do |t|
      ## Database unique
      t.string  :email,               null: false, default: ""

      ## Customized Variables ##

      ### Connecting Information
      t.integer :user_id,             null: false, default: 0

      ### Contact Information
      t.string  :company_name
      t.string  :contact_name
      t.text    :description
      t.integer :office_phone
      t.integer :fax_phone
      t.string  :website
      t.string  :address_1
      t.string  :address_2
      t.string  :city
      t.string  :state
      t.string  :country,             default: "United States of America"
      t.integer :zip_code
      t.string  :latitude
      t.string  :longitude

      ### Non-Profit Information
      t.boolean :nonprofit,           null: false, default: false
      t.string  :charity_navigator
      t.string  :guide_star
      t.string  :nonprofit_number     # String as it should be XX-XXXXXXX format #

      ### Social Medias
      t.string  :facebook
      t.string  :twitter
      t.string  :google_plus
      t.string  :instagram
      t.string  :pinterest
      t.string  :blog

      ### Other Variables
      t.boolean :published,           null: false, default: false
      t.boolean :verified,            null: false, default: false
      t.timestamps null: false
    end

    add_index :companies, :id,        unique: true
  end
end
