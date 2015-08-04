class Project < ActiveRecord::Base

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_attached_file :image, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}
  has_attached_file :image1, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}

	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
	}
  	validates_attachment :image1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
  	}

  def attachments
    [:image, :image1].map do |assn|
      self.try(assn)
    end.reject do |img|
      img.url.include? "missing.png"
    end
  end
end
