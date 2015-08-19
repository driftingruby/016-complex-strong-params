class User < ActiveRecord::Base
  attachment :profile_image, type: :image
  def full_name
    "#{first_name} #{last_name}"
  end
end
