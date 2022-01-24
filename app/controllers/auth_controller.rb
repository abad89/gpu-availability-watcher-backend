class AuthController < ApplicationController
   
    def login
        user = User.find_by(email: params[:emal])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Authenticated"}
        else
            render json: {failure: "Wong username or password"}
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