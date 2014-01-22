class Tag < ActiveRecord::Base
	before_validation :format_name
	has_and_belongs_to_many :posts

	def to_s
		'#' + text
	end

	def to_param
  		text
  	end


  	def self.find_or_create_from_tag_names(tag_names)
  			tag_names.split(/,\s?/).map do |tag_name|
	  		find_or_create_by(text: tag_name)
	  	end
  	end

  	private

  	def format_name
  		self.text = text.downcase.gsub(/[^a-z]/, '')
  	end


end
