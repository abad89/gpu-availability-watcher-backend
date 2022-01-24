class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create
        user = User.create!(user_params)
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token}, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user
            user.destroy
            render json: {}
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end


    private

    def user_params
        params.permit(:email, :password)
    end
end