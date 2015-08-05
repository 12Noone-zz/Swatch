class User < ActiveRecord::Base
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		user.provider = auth.provider 
		user.uid      = auth.uid
		user.name     = auth.info.name
		user.save
		end
	end

	has_secure_password

	has_many :projects, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :favorites, dependent: :destroy

	# validates :username, presence: true
	# validates :email, presence: true
	# validates :password_digest, presence: true
	# validates :password, length: { minimum: 6 }, allow_nil: true

	has_many(:favorite_projects, {through: :favorites, source: :project})

	# has_attached_file :avatar, styles: {
	# med: "200x200#",
	# }

	# validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end

