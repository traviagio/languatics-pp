class PostMailer < ActionMailer::Base
  default from: "Georgi@swagstagram.com"

  def new_post(post, user)
  	@post = post
  	mail to: user.email, subject: 'New post is created'
  end
end
