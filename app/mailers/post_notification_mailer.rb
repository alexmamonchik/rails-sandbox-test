class PostNotificationMailer < ApplicationMailer

  def new_post_created
    @post = params[:post]
    @user = params[:user]
    @url = post_url(@post)
    mail(to: @user.email, subject: "New post has been added")
  end
end
