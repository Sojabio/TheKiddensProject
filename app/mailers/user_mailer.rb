class UserMailer < ApplicationMailer
  default from: 'sojabio@protonmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_confirmation_email(user, order)
    @user = user
    @order = order

    mail(to: @user.email, subject: 'Merci pour votre commande !')
  end
end
