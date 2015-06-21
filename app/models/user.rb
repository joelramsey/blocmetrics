class User < ActiveRecord::Base
  
  has_many :registered_applications, dependent: :destroy
  has_many :events, through: :registered_applications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
