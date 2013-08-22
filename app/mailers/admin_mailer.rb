class AdminMailer < ActionMailer::Base

  default from: "admin@instavert.com"
  
  def new_user_waiting_for_approval(user)
    @user = user
    @url = superuser_dashboard_path
    mail(to: 'domingue.justin@gmail.com', subject: 'New user waiting for approval')
  end
end
