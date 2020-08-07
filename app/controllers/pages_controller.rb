class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home, :profile ]

  def home
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(20)
  end

  def profile
    @profile = User.find_by_username params[:username]
    @posts = @profile.posts
  end
end