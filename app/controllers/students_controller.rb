class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])

    set_meta_tags(
      title: @student.name + " | " + 'Bóng đá cộng đồng',
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @student.name.truncate_words(10, omission: '...'),
        description: @student.name.truncate_words(10, omission: '...'),
        image: @student.avatar.url
      }
    )
  end
end
