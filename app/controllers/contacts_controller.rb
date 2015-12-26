class ContactsController < ApplicationController
  layout 'main_app'
  respond_to :html

  before_action :set_active_section
  before_action :set_sidebar_view
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
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
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company_name, :fields)
  end
end
