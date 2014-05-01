# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  attr_accessor :password

  validates :username, :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :username, uniqueness: true

  def password=(plain_text)
    @password = plain_text
    self.password_digest = BCrypt::Password.create(plain_text) if @password
  end

  def is_password?(plain_text)
    BCrypt::Password.new(password_digest).is_password?(plain_text)
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    #password = params[:password]
    self.save!

    self.session_token
  end

  def self.find_by_credentials(user_credentials)
    user = User.find_by_username(user_credentials[:username])
    return user if user.try(:is_password?, user_credentials[:password])
    nil
  end


end
