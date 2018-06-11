class Product < ApplicationRecord
	
	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
	    message: 'Must be a gif, jpg or png image!' }

	has_many :line_items
	has_many :orders, through: :line_items

	before_destroy :ensure_not_referenced_by_any_line_item 
        
    translates :title, :description, :price, touch: true, :fallbacks_for_empty_translations => true
	
	private

	def ensure_not_referenced_by_any_line_item
	unless line_items.empty?
		errors.add(:base, 'Line Items Present')
		throw :abort
	 end
    end

end

