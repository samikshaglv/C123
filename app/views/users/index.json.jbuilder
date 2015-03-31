json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :title, :company, :office_phone, :mobile_phone, :work_address, :street, :city, :state, :zip, :website, :linkedin_profile_url, :profile_picture, :country_name :secret_token
  json.url user_url(user, format: :json)
end
