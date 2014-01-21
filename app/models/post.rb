class Post < ActiveRecord::Base
  has_many :comments
  has_and_belongs_to_many :tags
  has_attached_file :image,
  								styles: { thumb: "300x300>" },
  								storage: :s3,
  								s3_credentials: {
  									access_key_id: 'AKIAISJ3BURO2DLFVRKQ',
  									secret_access_key: Rails.application.secrets.secret_access_key
  								},
  								bucket: 'swagstagram'



	def tag_names
	     tags.map{|tag| tag.name}.join(', ')
	end

	  def tag_names=(tag_names)
	  	self.tags = tag_names.split('/,\? ').map do |tag_name|
	  		tag_name.downcase.gsub(/[^a-z]/, '')
	  		Tag.find_or_create_by(text: tag_name)
	  	end
	  end

	  def self.for_tag_or_all(tag_name)
	  	tag_name ? Tag.find_by(text: tag_name).posts : all
	  end

end