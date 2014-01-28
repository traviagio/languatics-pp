class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

   has_many :posts



	def self.find_for_twitter_oauth(auth)
		pwd = Devise.friendly_token[0,20]
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.password = pwd
	    user.save!
	  end
	end


	def email_required?
		return false if provider == 'twitter'
		super
	end

end
