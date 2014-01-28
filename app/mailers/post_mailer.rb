class PostMailer < ActionMailer::Base
  default from: "getrollins@yahoo.com"

  def new_post(post, user)
  	@post = post
  	if user && !user.email.blank?
	  	mail to: user.email, subject: 'New post is created'
	  end
  end
end
