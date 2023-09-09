class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:slug])
    @posts = @category.posts.activated.order(created_at: :desc).page(params[:page]).per(6)
    @post_news = Post.activated.order(created_at: :desc).last(3)

    set_meta_tags(
      title: 'Bóng đá cộng đồng',
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @category.name.truncate_words(10, omission: '...'),
        description: @category.name.truncate_words(10, omission: '...'),
        image: 'https://blog-football.s3.amazonaws.com/uploads/banner-breadcrumb.jpg'
      }
    )
  end
end
