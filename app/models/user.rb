class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :photos       , foreign_key: :user_id, dependent: :destroy
  has_many :comments     ,foreign_key: :user_id, dependent: :destroy
  has_many :likes,foreign_key: :user_id, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  with_options presence: true do
  validates :name 
  validates :birthday
  end

  def liked_by?(photo_id)
    likes.where(photo_id: photo_id).exists?
  end
end
