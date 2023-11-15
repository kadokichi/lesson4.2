class UsersController < ApplicationController
    def top
    end

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    end

    def show
        @user = User.find(current_user.id)
        @room = Room.new
    end

    def edit
        @user = User.find(params[:user_id])
    end

    def update
    end

    def destroy
    end

    def sign_in
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :introduce, :image_name, :image)
    end

end
