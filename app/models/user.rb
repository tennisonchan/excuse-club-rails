class User < ApplicationRecord
  has_secure_token :token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  has_and_belongs_to_many :buddies, class_name: 'User', join_table: 'buddies'
  has_many :excuses
  has_and_belongs_to_many :begs, class_name: 'Excuse', join_table: 'beggings', foreign_key: 'begging_id'
  has_many :beers, class_name: 'Excuse', foreign_key: :brother_id

  validates :phone, presence: true, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
