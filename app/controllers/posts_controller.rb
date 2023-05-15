class PostsController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:category_slug])
    @post = @category.posts.find_by(slug: params[:slug])
    @random_records = @category.posts.order("RANDOM()").where.not(slug: params[:slug]).last(3)
  end
end
