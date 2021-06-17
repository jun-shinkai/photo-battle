class Photo < ApplicationRecord
  validates :info, presence: true
  belongs_to :user
  has_many :comments
  has_one_attached :image


  def self.search(search)
    if search != ""
      Photo.where('info LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end
