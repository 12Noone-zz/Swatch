class User < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many(:favorite_projects, {through: :favorites, source: :project})

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
			user.provider = auth.provider 
			user.uid      = auth.uid
			user.name     = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
		end
	end
end