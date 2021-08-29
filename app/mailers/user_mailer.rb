class UserMailer < ApplicationMailer
    def user_mail(user)
        @user = user
        mail to: user.email, subject: "Email de confirmation de la demande"
    end
end
