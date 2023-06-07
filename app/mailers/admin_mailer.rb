class AdminMailer < ApplicationMailer
    default from: 'sojabio@protonmail.com'


  def admin_order_confirmation_email(user, order)
    @user = user
    @order = order

    mail(to: "sojabio@yopmail.fr", subject: 'Une commande a été passée !')

    #changer l'adresse quand un admin sera paramétrée
  end
end
