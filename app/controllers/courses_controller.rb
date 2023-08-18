class CoursesController < ApplicationController
  def show
    @course = Course.find_by(slug: params[:slug])
    @courses = Course.all.activated.order("created_at desc")

    @students = @course.students
    @coaches = @course.coachs

    @contact = Contact.new
  end
end
