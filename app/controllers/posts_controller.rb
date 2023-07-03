class PostsController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:category_slug])
    @post = @category.posts.find_by(slug: params[:slug])
    @post_news = Post.order(:created_at).last(3)
    @random_records = @category.posts.order("RANDOM()").where.not(slug: params[:slug]).last(2)
  end
end
