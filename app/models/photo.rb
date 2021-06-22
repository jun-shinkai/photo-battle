class Photo < ApplicationRecord
belongs_to :user,optional: true
  has_many :likes, foreign_key: "photo_id", dependent: :destroy
  has_many :comments, foreign_key: "photo_id", dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :orders
  has_one_attached :title_image
  acts_as_taggable 
  acts_as_taggable_on :skills, :interests
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :category

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  with_options presence: true do
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  validates :info
  validates :price,format: { with: VALID_PRICEL_HALF }, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true,
    greater_than: 299, less_than: 10_000_000 }
  validates :title
  validates :title_image
  end
  
  

  
  def self.search(search)
    if search != ""
      Photo.where('title LIKE(?)', "%#{search}%")
    else
      Photo.all
    end
  end

end