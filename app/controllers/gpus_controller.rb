class GpusController < ApplicationController

    def index
        if params[:user_id]
            user = User.find(params[:user_id])
            gpus = user.gpus
        else
            gpus = Gpu.all
        end
        render json: gpus
    end

end
