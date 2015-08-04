class Project < ActiveRecord::Base
  attr_accessible :avatar

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	
  def attachments
    [:image, :image1].map do |assn|
      self.try(assn)
    end.reject do |img|
      img.url.include? "missing.png"
    end
  end
end
