class Photo < ApplicationRecord
  validates :info, presence: true
  validates :name, presence: true
  belongs_to :user
  has_one_attached :image


  def self.search(search)
    if search != ""
      Photo.where('text LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end
end
