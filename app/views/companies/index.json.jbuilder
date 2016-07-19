json.array!(@companies) do |company|
  json.extract! company, :id, :user_id, :companyName, :description, :officePhone, :faxPhone, :email, :website, :nonProfit, :charityNavigator, :guideStar, :address1, :address2, :city, :state, :country, :zipCode, :latitude, :longitude, :facebook, :twitter, :googlePlus, :instagram, :pinterest, :tubler, :published
  json.url company_url(company, format: :json)
end
