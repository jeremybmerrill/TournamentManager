class UserMailer < ActionMailer::Base
  default :from => "admin@tabroom.info"
    def pairings_email(user)
        @user = user
        @url  = "http://example.com/login"
        mail(:to => user.email, :subject => "Pairings available")
    end
end
