class AboutsController < ApplicationController
  def show
    @abouts = About.all.order(:created_at)
    @about = About.find_by(slug: params[:slug])
    @posts = Post.activated.order(created_at: :desc).page(params[:page]).per(9)
    @coaches = Coach.all

    set_meta_tags(
      title: 'Bóng đá cộng đồng',
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @about.title,
        description: @about.title,
        image: @about.image_intro.url
      }
    )

  end
end
