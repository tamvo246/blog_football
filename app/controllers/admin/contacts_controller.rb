class Admin::ContactsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @contacts = Contact.order(created_at: :desc)

    if params[:created_from].present?
      @contacts = @contacts.where("created_at >= ?", params[:created_from])
    end

    if params[:created_to].present?
      @contacts = @contacts.where("created_at <= ?", params[:created_to])
    end

    if params[:course_id].present?
      @contacts = @contacts.where(course_id: params[:course_id])
    end

    @contacts = @contacts.page(params[:page]).per(10).order("created_at desc")

  end

  def destroy
    @contact = Contact.find(params[:id])
    authorize! :destroy, @contact
    @contact.destroy
    flash[:success] = "Xoá liên thành công"
    redirect_to admin_contacts_path
  end

  def show
    @contact = Contact.find(params[:id])
    # redirect_to admin_contact_path
  end
end
