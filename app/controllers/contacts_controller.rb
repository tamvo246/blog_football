class ContactsController < ApplicationController

  def new
    @contact = Contact.new

    set_meta_tags(
      title: 'Bóng đá cộng đồng',
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @course.name.truncate_words(10, omission: '...'),
        description: @course.target.truncate_words(10, omission: '...'),
        image: 'https://blog-football.s3.amazonaws.com/uploads/contact-us-1908762_640.png'
      }
    )
  end

  def create
    @contact = Contact.new(contact_params)
    if  @contact.save
      flash[:contact] = "Gửi thông tin liên hệ thành công"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = @contact.errors.full_messages[0].to_s
      redirect_back(fallback_location: root_path)
    end

  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :title, :email, :phone, :title, :content, :address, :course_id)
  end

end
