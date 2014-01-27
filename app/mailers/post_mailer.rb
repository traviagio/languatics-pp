class PostMailer < ActionMailer::Base
  default from: "Georgi@swagstagram.com"

  def new_post
  	mail to: 'georgiev.georgio@gmail.com', subject: 'New post is created'
  end
end
