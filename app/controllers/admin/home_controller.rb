class Admin::HomeController < Admin::BaseController
  def admin_page
    @post_count = Post.all.count
    @about_count = About.all.count
    @course_count = Course.all.count
    @student_count = Student.all.count
    @category_count = Category.all.count
    @image_count = AlbumImage.all.count
    @contact_count = Contact.all.count
    @coach_count = Coach.all.count
    @view_count = Post.sum(:views_count)
  end
end
