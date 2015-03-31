class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable
       
def self.connect_to_linkedin(auth, signed_in_resource=nil)

    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
        Rails.logger.warn auth
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
 Rails.logger.warn "hiiiiiiiiiiiiiiiii"
Rails.logger.warn a = auth["extra"]["raw_info"]["positions"]["values"].map{|h| h.company.first}
Rails.logger.warn compnm = a.to_h
Rails.logger.warn compnm["name"]
Rails.logger.warn pn = auth["extra"]["raw_info"]["phoneNumbers"]["values"].map{|h| h.first}
Rails.logger.warn b = pn.to_h
Rails.logger.warn "hiiiiiiiiiiiiiiiii"
Rails.logger.warn street_add = auth["extra"]["raw_info"]["location"].name
 Rails.logger.warn street_add.inspect
Rails.logger.warn "hiiiiiiiiiiiiiiiii"
Rails.logger.warn country_code = auth["extra"]["raw_info"]["location"]["country"].code
 code = IsoCountryCodes.find(country_code)
     # => "Australia"
 Rails.logger.warn country_name = code.name 

Rails.logger.warn b["phoneNumber"]
Rails.logger.warn "hiiiiiiiiiiiiiiiii"
       @user = User.create(name:auth.info.first_name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                            first_name:auth.info.first_name,
                            last_name:auth.info.last_name,
                            title:auth.info.headline,
                            work_address:auth.info.location,
                            company:compnm["name"],
                            office_phone:b["phoneNumber"],
                            mobile_phone:b["phoneNumber"],
                            website:auth.info.industry,
                            linkedin_profile_url:auth.info.urls.public_profile,
                            profile_picture:auth.info.image,
                            city:auth.info.location,
                            street:auth.info.location,
                            state:auth.info.location,
                            zip:auth.info.location,
                            country:country_name,
                            secret_token:SecureRandom.urlsafe_base64
                          )
      end

    end
    end     
   end
  