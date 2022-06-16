class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: @contact.email, subject: "写真投稿完了しました！"
  end
end