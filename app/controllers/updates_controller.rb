class UpdatesController < ApplicationController
    def index
        updates = Update.all
        render json: updates
    end
end
