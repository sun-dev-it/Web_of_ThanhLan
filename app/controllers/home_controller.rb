class HomeController < ApplicationController
    def index
        if logged_in?
          @user = User.find_by(params[:id])
        end
    end
end
