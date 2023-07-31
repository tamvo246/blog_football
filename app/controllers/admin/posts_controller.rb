class Admin::PostsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Thêm bài viết thành công"
      redirect_to admin_posts_path
    else
      flash[:error] = @post.errors.full_messages[0].to_s
      render :new
    end

  end

  def update
    authorize! :update, @post
    if @post.update(post_params.merge(user_id: current_user.id))
      flash[:success] = "Sửa bài viết thành công"
      redirect_to admin_posts_path
    else
      flash[:error] = @post.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :update, @post
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    flash[:success] = "Xoá bài viết thành công"
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :intro, :slug, :category_id, :hide_status, :image_intro)
  end
end
