class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :check_user_profile, except: [:edit]

    def check_user_profile()
        if user_signed_in?
            
            if current_user.name == nil
                redirect_to edit_user_path(current_user)
            elsif current_user.address == nil
                redirect_to edit_user_path(current_user) 
            elsif current_user.display_name == nil
                redirect_to edit_user_path(current_user)
            end
        end
    end

    def after_sign_in_path_for(resource)
        return new_user_path
    end
end
