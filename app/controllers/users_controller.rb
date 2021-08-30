class UsersController < ApplicationController

  before_action :set_user, only: %i[ show edit update destroy ]

    skip_before_action :login_required, only: [:new, :create]
      
      def new
        @user= User.new
      end

      def edit
      end
    
      def show
        @user= User.find(params[:id])
      end
    
      def create
        @user= User.new(user_params)
          if @user.save
              redirect_to user_path(@user.id)
          else
            render :new
          end
      end

      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: "User was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end
    
      private
  
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
      end
  end