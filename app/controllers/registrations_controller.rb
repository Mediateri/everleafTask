class RegistrationsController < Devise::RegistrationsController
    private
    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :admin)
    end
    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :admin)
    end
    def destroy
        @user = User.find(params[:id])
        if @user.tasks?
            Task.where(user_id: params[:id]).destroy
        end
        @user.destroy
        redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    end
 end
