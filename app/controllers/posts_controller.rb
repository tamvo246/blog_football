class PostsController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:category_slug])
    @post = @category.posts.find_by(slug: params[:slug])
    @post_news = Post.order(:created_at).last(3)
    @random_records = @category.posts.order("RANDOM()").where.not(slug: params[:slug]).last(2)
    unless cookies["post_viewed_#{params[:id]}"]
      # Increment the view count using counter_culture
      @post.increment!(:views_count)

      # Set a cookie to indicate that the user has viewed this post.
      cookies["post_viewed_#{params[:id]}"] = { value: 'yes', expires: 1.hour.from_now, httponly: true }
    end
  end
end
