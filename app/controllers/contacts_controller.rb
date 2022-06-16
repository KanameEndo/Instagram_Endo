class ContactsController < ApplicationController
  def new
      @contact = Contact.new
  end

  def create
      @contact = Contact.new(contact_params)
      if @contact.save
          redirect_to new_path, notice: "OKです"
      else
          render :new
      end
  end
end

private
  def contact_params
      params.require(:contact).permit(:name,:email,:content,:image)
  end