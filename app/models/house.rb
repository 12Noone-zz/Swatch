class House < ActiveRecord::Base
	
	belongs_to :user
	has_many :projects


  	has_attached_file :image1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  	 def attachments
    [:image].map do |assn|
      self.try(assn)
    end.reject do |img|
        # img.url.include? "missing.png"
    end
  end
end

