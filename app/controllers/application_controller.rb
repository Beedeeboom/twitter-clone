class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :check_user_profile, except: [:edit, :update, :destroy, :create]

    def check_user_profile
        # render plain: current_user.inspect
        # if user_signed_in?
        #     if !current_user.name || !current_user.address || !current_user.display_name
        #         redirect_to edit_user_path(current_user)
        #     end
        # end
    end

    def after_sign_in_path_for(resource)
        # return new_user_path
        if !current_user.name || !current_user.address || !current_user.display_name
            return edit_user_path(current_user)
        else
            return root_path 
        end
    end
end
