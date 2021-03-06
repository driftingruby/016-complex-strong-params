class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image, type: :image

  enum role: { admin: 0, client: 1}

  def full_name
    "#{first_name} #{last_name}"
  end
end
