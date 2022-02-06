class UserMailer < ApplicationMailer
    default from: "gpuaw@antgbad.com",
            bcc: "antgbad@gmail.com"
        

    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subject: "Welcome to GPU Availability Watcher")
    end

    def gpu_available
        @user = params[:user]
        @gpu = params[:gpu]
        mail(to: @user.email, subject: "GPU Now Available")
    end
end
