class User < ApplicationRecord

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :password_archivable, :session_limitable, :paranoid_verification, :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable
  after_create :generate_paranoid_code
  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :login_activities, as: :user
  has_many :services

  def self.invite_key_fields
    [:email]
  end

  def invitation_limit
    if self.has_role?(:user_inviter)
      return nil
    else
      return 0
    end
  end
end
