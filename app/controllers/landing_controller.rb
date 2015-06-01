class LandingController < ApplicationController
  def index
    
  end

  def register
    generated_password = Devise.friendly_token.first(8)
    email = params[:email]
    user = User.create(:email => email, :password => generated_password)
    if user
      LandingMailer.send_register_mail(email, generated_password).deliver_now
      redirect_to landing_path, notice: "Merci, un e-mail vous a été envoyé !"
    else
      redirect_to landing_path, notice: "Cet e-mail a déjà été utilisé ou est invalide"
    end
  end
end
