class ChargesController < ApplicationController

before_filter :authenticate_user!

def create
  # Amount in cents
  @amount = 1500

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'GBP'
  )

  	#below here
  flash[:notice] = 'Your payment was successful'
  redirect_to '/posts'

  	#email

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to '/posts'
end


end
