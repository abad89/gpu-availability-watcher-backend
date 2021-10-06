class UsergpusController < ApplicationController

    def index
        if params[:user_id]
            user=User.find(params[:user_id])
            usergpus=user.usergpus
            render json: usergpus, include: :gpu
        else
            usergpus = Usergpu.all
            render json: usergpus
        end
    end

    def create
        usergpu = Usergpu.create(usergpu_params)
        render json: usergpu, status: :created
    end

    def show
        usergpu = find_usergpu
        render json: usergpu
    end

    def destroy
        usergpu = find_usergpu
        if usergpu
            usergpu.destroy
            render json: {}
        else
            render json: { error: "not found" }, status: :not_found
        end
    end

    private

    def usergpu_params
        params.permit(:user_id, :gpu_id)
    end

    def find_usergpu
        Usergpu.find(params[:id])
    end
end
