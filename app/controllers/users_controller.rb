class UsersController < ApplicationController
     def login
       render :action => "login", :layout => false
      end

      def signup
        @user = User.new
      end

      def register_user
          @user = User.new(user_params)
          if @user.valid?
            @user.encryptPass(@user.password)
            @user.encryptPassonfirm(@user.password_confirmation)
            @user.save
            acc = Account.new
            acc.user_id = @user.id
            acc.account_number = generate_10
            acc.account_type = 'savings'
            acc.amount = 0
            acc.save
            redirect_to :action => 'login'
          else
            @user.password = ""
            render :action => "signup"
          end
      end

      def signin
        if params[:user_name] !="" && params[:password]!=""
          @user = User.authenticate(params[:user_name], params[:password])
          if @user
             session[:user] = @user
             redirect_to :action => "dashboard",:controller => "accounts",id: @user.id
          else
             flash[:error] = "Invalid User Name or Password."
             redirect_to :controller => "users", :action => "login"
           end
        else
           flash[:error] = "Invalid User Name or Password."
          redirect_to :controller => "users", :action => "login"
        end
      end

     def signout
        session[:user] = nil
        redirect_to :action => "login"
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          @user.save
          redirect_to :action => "wishlist",id: @user.id
        else
          flash[:error] = "Error occurs,profile has not updated."
          render :action => "edit"
        end
      end


end
