class AuthController < ApplicationController
   
    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Authenticated"}
            puts "accepted"
        else
            render json: {errors: "Wrong username or password."}, status: :unauthorized
            puts "not accepted"
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No user logged in"}
        end
    end

end