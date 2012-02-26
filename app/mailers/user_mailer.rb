class UserMailer < ActionMailer::Base
  default :from => "admin@tabroom.info"
    def pairings_email(user)
        @user = user
        @url  = "http://tabroom.info/login"
        mail(:to => user.email, :subject => "New pairings available!")
    end
end
