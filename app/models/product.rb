class Product < ActiveRecord::Base

	# presence: true tells the validator to check that each of the named fields is present and its contents are not empty.
	validates :title, :description, presence: true
	validates :price , numericality: {greater_than_or_equal_to: 9.99} 
	validates :title, uniqueness: true
	#validates :image_id, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'}
end
