class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    flash[:notice] = "Gửi thông tin liên hệ thành công"
    redirect_to contact_path
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :title, :email, :phone, :title, :content)
  end

end
