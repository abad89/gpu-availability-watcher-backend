class UserMailer < ApplicationMailer
    default from: "gpuaw@antgbad.com",
            bcc: "antgbad@gmail.com"
        

    def welcome_email
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: "Welcome to GPU Availability Watcher")
    end
end
