class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
    @posts = @category.posts.page(params[:page]).per(12)
    @post_news = Post.order(:created_at).last(3)
  end
end
