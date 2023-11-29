class UsersController < ApplicationController
    def top
        @user = current_user
    end

    def index
        @user = current_user
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
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to :users
        else
            render "edit"
        end
    
    end

    def destroy
    end

    def sign_in
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :introduce, :image_name, :image,)
    end

end
