class AdminMailer < ActionMailer::Base

  default from: "admin@instavert.com"
  
  def new_user_waiting_for_approval(user)
    @user = user
    @url = superuser_dashboard_path
    mail(to: 'domingue.justin@gmail.com', subject: "Instavert: Nouvel utilisateur en attente d'activation")
  end
  
  def subscription_error(user, message)
    @user = user
    @message = message
    mail(to:'domingue.justin@yopmail.com', subject:"Instavert: Erreur d'abonnement")
  end
end
