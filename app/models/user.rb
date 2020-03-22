class User < ApplicationRecord
  mount_uploader :image, UserUploader
  validates :email, presence: true
  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def update_user_info(params)
    self.password = params[:new_password] if params[:new_password].present?
    self.email = params[:email]
    save
  end
end
