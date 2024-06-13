class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            flash[:success] = "Hi " + user.name + "!"
            redirect_back_or root_url
        else
            flash[:danger] = "Email hoac mat khau sai"
            redirect_to login_path
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end
end
