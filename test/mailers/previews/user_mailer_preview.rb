# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview


    def welcome_email
        user = User.new(email: "testemail123@gmail.com")
        UserMailer.with(user: user).welcome_email
    end

    def gpu_available
        user = User.new(email: "generic@email.com")
        gpu = Gpu.new(name: "RTX Super COOL 4080", url: "http://antgbad.com")
        UserMailer.with(user: user, gpu: gpu).gpu_available
    end



end
