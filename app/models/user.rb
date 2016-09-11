class User < ApplicationRecord
  has_secure_token :token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  has_many :excuses
  has_many :beers, class_name: 'Excuse', foreign_key: :brother_id
end
