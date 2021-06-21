class Photo < ApplicationRecord
  validates :info, presence: true
  belongs_to :user,optional: true
  has_many :likes, foreign_key: "photo_id", dependent: :destroy
  has_many :comments, foreign_key: "photo_id", dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :title_image, dependent: :destroy
  acts_as_taggable 
  acts_as_taggable_on :skills, :interests
  end

  
  def self.search(search)
    if search != ""
      Photo.where('info LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end

