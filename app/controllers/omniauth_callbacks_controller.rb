class OmniauthCallbacksController < ApplicationController

	def twitter
		raise twitter_auth request.env
	end
end
