class Notifier < ActionMailer::Base
  default from: "Allahabad Cinemas chaitiagrawal@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.User.email, subject: 'Tickets Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.User.email, subject: 'Tickets sent'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.registered.subject
  #
  def registered(login)
    @login = login
    mail to: @login.User.email, subject: 'User Profile Registered'
  end

  def forgot(login)
    @log = login
    mail to: @log.User.email, subject: 'Account Details'
  end
end
