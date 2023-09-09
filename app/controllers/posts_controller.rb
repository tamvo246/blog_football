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

    set_meta_tags(
      title: @post.title,
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @post.title.truncate_words(10, omission: '...'),
        description: @post.intro.truncate_words(10, omission: '...'),
        image: @post.image_intro.url
      }
    )
  end
end
