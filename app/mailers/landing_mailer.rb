class LandingMailer < ActionMailer::Base
  # layout 'mailers/layouts/mailer_layout'
  default template_path: 'mailers/landing_mailer'

  def send_register_mail(mail, password)
    @password = password
    mail(to: [mail,'karim.mortabit@gmail.com'], from: 'karim.mortabit@gmail.com', subject: 'Bienvenue chez FoxTips !')
  end
end