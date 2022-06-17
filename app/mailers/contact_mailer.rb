class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: @contact.user.email, subject: "写真投稿完了しました！"
  end
end