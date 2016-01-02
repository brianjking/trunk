class ContactsController < ApplicationController
  layout 'main_app'
  respond_to :html

  before_action :set_active_section
  before_action :set_sidebar_view
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts
  end

  def show
    respond_to do |format|
      format.json
      format.html {
        redirect_to edit_contact_path(@contact)
      }
    end
  end

  def new
    @contact = Contact.new
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private

  def set_active_section
    @active_section = :contacts
  end

  def set_sidebar_view
    @sidebar_view = 'contacts/sidebar'
  end

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company_name, :fields, :notes)
  end
end
