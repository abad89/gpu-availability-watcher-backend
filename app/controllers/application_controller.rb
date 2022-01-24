class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, "12422")
    end
end
