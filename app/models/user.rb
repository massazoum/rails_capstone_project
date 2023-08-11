class User < ApplicationRecord
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,,:rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_many :recipes
  has_many :inventories
  
end
