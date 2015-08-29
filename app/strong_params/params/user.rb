module Params
  module User
    def user
      params.require(:user).permit(*user_attributes)
    end

    def user_attributes
      [].tap do |attributes|
        attributes << :first_name
        attributes << :last_name
        attributes << :role if current_user.admin?
        attributes << :email
        attributes << :profile_image
      end
    end
  end
end
