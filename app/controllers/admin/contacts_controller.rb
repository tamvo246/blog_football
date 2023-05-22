class Admin::ContactsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @contacts = Contact.order(created_at: :desc).page(params[:page]).per(2)
  end

  def destroy
    @contact = Contact.find(params[:id])
    authorize! :destroy, @contact
    @contact.destroy
    redirect_to admin_contacts_path
  end
end
