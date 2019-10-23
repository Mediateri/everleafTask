class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 40}
  validates :email, presence: true, uniqueness: true, length: {maximum: 200},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy 
  def self.admins
    @users = User.all
  @admins=0
    @users.each do |user|
      if user.role?
        @admins += 1
      end
    end
    return @admins
  end
end
