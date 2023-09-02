class CoursesController < ApplicationController
  def show
    @course = Course.find_by(slug: params[:slug])
    @courses = Course.all.activated.order("created_at desc")

    @students = @course.students
    @coaches = @course.coachs

    @contact = Contact.new

    set_meta_tags(
      title: 'Bóng đá cộng đồng',
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @course.name.truncate_words(10, omission: '...'),
        description: @course.target.truncate_words(10, omission: '...'),
        image: 'https://blog-football.s3.amazonaws.com/uploads/banner-breadcrumb.jpg'
      }
    )

  end
end
