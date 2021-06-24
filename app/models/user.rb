class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  has_many :orders
  has_many :photos       , foreign_key: :user_id, dependent: :destroy
  has_many :comments     ,foreign_key: :user_id, dependent: :destroy
  has_many :likes,foreign_key: :user_id, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo
  has_many :sns_credentials

  with_options presence: true do
  validates :name 
  validates :birthday
  end

  def liked_by?(photo_id)
    likes.where(photo_id: photo_id).exists?
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
     # sns認証したことがあればアソシエーションで取得
   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
        name: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
