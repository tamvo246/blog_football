class HomeController < ApplicationController
  def index
    @about = About.first

    @posts = Post.activated.order(created_at: :desc).take(3)

    @album_images = AlbumImage.all.limit(6)

    @banners = Banner.all

    @courses = Course.all.activated

    set_meta_tags(
      title: 'Bóng đá cộng đồng',
      description: 'Product Description',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: "Bóng đá cộng đồng",
        description: 'Bóng đá cộng đồng',
        image: "https://blog-football.s3.amazonaws.com/uploads/banner-home-2.png"
      }
    )
  end

  def search
    if params["search"].present?
      search_params = params["search"]
      sql = "SELECT posts.*
      FROM posts
      WHERE (title ILIKE '%#{search_params}%')
      OR (intro ILIKE '%#{search_params}%')
      OR (content ILIKE '%#{search_params}%')
      order by (case when title ILIKE '%#{search_params}%' then 1
                when intro ILIKE '%#{search_params}%' then 2
                when content ILIKE '%#{search_params}%' then 3
                end)
      "
      post_lists = Post.find_by_sql(sql).uniq
      @posts = Kaminari.paginate_array(post_lists).page(params[:page]).per(10)
    else
      redirect_to root_path
    end
  end
end
