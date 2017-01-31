class ChargesController < ApplicationController

	def create
		# Creates a Stripe Customer object, for associating with the charge
		customer = Stripe::Customer.create(
			email: current_user.email, 
			card: params[:stripeToken]
			)

		# Where the real magic happens
		charge = Stripe::Charge.create(
			customer: customer.id, # Note -- this is NOT the user_id in your app
			amount: 15_00,
			description: "Blocipedia premium membership - #{current_user.email}",
			currency: 'usd'
			)

		#current_user.role = "premium"
		current_user.update_attributes(role: "premium")

		flash[:notice] = "Thanks for becoming a Blocipedia premium member, #{current_user.name}!"
		redirect_to root_url # or where ever 

		# Stripe will send back CardErrors, with friendly messages when something goes wrong.
		# This `rescue block` catches and displays those errors.
	rescue Stripe::CardError => e 
		flash[:alert] = e.message 
		redirece_to new_charge_path
	end

	def new
		@stripe_btn_data = {
			key: "#{ Rails.configuration.stripe[:publishable_key] }",
			description: "Blocipedia premium membership - #{current_user.email}",
			amount: 15_00
		}
	end

	def down_grade
		#raise
		#current_user.update_attributes(role: "standard")
		current_user.standard!
		current_user.wikis.private_wikis.each do |wiki|
			wiki.private = false
			wiki.save
		end
		flash[:notice] = "You are now downgraded to standard user."
		redirect_to root_url
	end

end
