class UsersController < ApplicationController
    include SessionsHelper

    before_action :logged_in , only: [:show]
    # before_action :correct_user , only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User created successfully."
            redirect_to root_url
          else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        @events =  @user.events
    end


    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end


        def logged_in
            unless logged_in?
              flash[:danger] = "Please login first!!!"
              redirect_to login_path
            end
        end

        def correct_user
            unless @current_user == @user
                redirect_to root_path
            end
        end

end
