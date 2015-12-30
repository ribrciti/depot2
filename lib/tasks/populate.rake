namespace :db do
	desc "Erase and fill database"
	task populate: :environment do
		require 'populator'
		#require 'faker'

		[Product].each(&:delete_all)

		Product.populate (30) do | product |
			product.title = Populator.words(1..2).titleize + " Rotary Phone"
			product.image_id = "#{product.id}.jpg"
			product.description = Populator.sentences(2..4)
			product.price = rand(33.99..129.99)
			product.cost_price = product.price*(rand(0.5..0.8))
			product.created_at = 1.years.ago..Time.now
			product.active = "1"
			product.weight = rand(3.2..9.9)
			product.sku = rand(00001..99999)
			
		end
	end		
end