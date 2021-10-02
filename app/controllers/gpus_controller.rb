class GpusController < ApplicationController

    def index
        gpus = Gpu.all
        render json: gpus
    end

end
