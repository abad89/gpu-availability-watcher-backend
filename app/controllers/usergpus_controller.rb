class UsergpusController < ApplicationController

    def index
        if params[:user_id]
            user=User.find(params[:user_id])
            usergpus=user.usergpus
            render json: usergpus, include: :gpu
        else
            usergpus = Usergpus.all
            render json: usergpus
        end
    end
end
