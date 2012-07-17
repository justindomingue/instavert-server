class NotificationsMailer < ActionMailer::Base
  default :from => "domingue.justin@gmail.com"
  default :to => "domingue.justin@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Envert] Commentaires sur le site web")
  end

end