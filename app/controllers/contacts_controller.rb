class ContactsController < ApplicationController

  def new
    @contact = Contact.new
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
